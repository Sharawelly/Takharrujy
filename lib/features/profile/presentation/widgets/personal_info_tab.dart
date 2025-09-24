import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'profile_form_field.dart';
import 'profile_button.dart';

class PersonalInfoTab extends StatefulWidget {
  const PersonalInfoTab({super.key});

  @override
  State<PersonalInfoTab> createState() => _PersonalInfoTabState();
}

class _PersonalInfoTabState extends State<PersonalInfoTab> {
  // Form controllers
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController(text: 'John');
  final _lastNameController = TextEditingController(text: 'Smith');
  final _emailController = TextEditingController(
    text: 'john.smith@university.edu',
  );
  final _studentIdController = TextEditingController(text: 'ST2025001');
  final _phoneController = TextEditingController(text: '+1 (555) 000-0000');
  final _bioController = TextEditingController();

  // Dropdown values
  String selectedUniversity = 'University of Technology';
  String selectedFaculty = 'Computer Science';
  String selectedDepartment = 'Software Engineering';

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _studentIdController.dispose();
    _phoneController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // First Name and Last Name Row
            Row(
              children: [
                Expanded(
                  child: ProfileFormField(
                    label: 'First Name',
                    controller: _firstNameController,
                    width: 152.w,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: ProfileFormField(
                    label: 'Last Name',
                    controller: _lastNameController,
                    width: 152.w,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),

            // Email Address
            ProfileFormField(
              label: 'Email Address',
              controller: _emailController,
              width: 316.w,
              helperText: 'Used for login and notifications',
            ),
            SizedBox(height: 16.h),

            // Student ID
            ProfileFormField(
              label: 'Student ID',
              controller: _studentIdController,
              width: 316.w,
              enabled: false,
            ),
            SizedBox(height: 16.h),

            // University Dropdown
            ProfileDropdownField(
              label: 'University',
              value: selectedUniversity,
              items: const [
                'University of Technology',
                'University of Science',
                'University of Engineering',
              ],
              onChanged: (value) {
                setState(() {
                  selectedUniversity = value!;
                });
              },
            ),
            SizedBox(height: 16.h),

            // Faculty and Department Row
            Row(
              children: [
                Expanded(
                  child: ProfileDropdownField(
                    label: 'Faculty',
                    value: selectedFaculty,
                    items: const [
                      'Computer Science',
                      'Engineering',
                      'Business',
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedFaculty = value!;
                      });
                    },
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: ProfileDropdownField(
                    label: 'Department',
                    value: selectedDepartment,
                    items: const [
                      'Software Engineering',
                      'Computer Engineering',
                      'Data Science',
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedDepartment = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),

            // Phone Number
            ProfileFormField(
              label: 'Phone Number',
              controller: _phoneController,
              width: 316.w,
              hintText: '+1 (555) 000-0000',
            ),
            SizedBox(height: 16.h),

            // Bio
            ProfileFormField(
              label: 'Bio',
              controller: _bioController,
              width: 316.w,
              hintText: 'Tell us about yourself...',
              maxLines: 3,
            ),
            SizedBox(height: 24.h),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ProfileButton(
                    text: 'Cancel',
                    onPressed: _cancelChanges,
                    isPrimary: false,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: ProfileButton(
                    text: 'Save',
                    onPressed: _saveChanges,
                    isPrimary: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _cancelChanges() {
    // Reset form to original values
    _firstNameController.text = 'John';
    _lastNameController.text = 'Smith';
    _emailController.text = 'john.smith@university.edu';
    _studentIdController.text = 'ST2025001';
    _phoneController.text = '+1 (555) 000-0000';
    _bioController.clear();
    setState(() {
      selectedUniversity = 'University of Technology';
      selectedFaculty = 'Computer Science';
      selectedDepartment = 'Software Engineering';
    });
  }

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement save functionality
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile updated successfully!'),
          backgroundColor: Color(0xFF16A34A),
        ),
      );
    }
  }
}
