import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/text_styles.dart';
import 'file_upload_area.dart';
import 'file_item_widget.dart';

class UploadedFile {
  final String name;
  final String size;
  final String type;
  final String path;

  const UploadedFile({
    required this.name,
    required this.size,
    required this.type,
    required this.path,
  });
}

class FileUploadWidget extends StatefulWidget {
  final List<UploadedFile> uploadedFiles;
  final ValueChanged<List<UploadedFile>> onFilesChanged;
  final VoidCallback? onBrowseFiles;

  const FileUploadWidget({
    super.key,
    required this.uploadedFiles,
    required this.onFilesChanged,
    this.onBrowseFiles,
  });

  @override
  State<FileUploadWidget> createState() => _FileUploadWidgetState();
}

class _FileUploadWidgetState extends State<FileUploadWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Upload Files Section
        FileUploadArea(onBrowseFiles: widget.onBrowseFiles),
        SizedBox(height: 16.h),

        // Uploaded Files List
        if (widget.uploadedFiles.isNotEmpty) ...[
          _buildUploadedFilesSection(),
          SizedBox(height: 16.h),
        ],
      ],
    );
  }

  Widget _buildUploadedFilesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          'Uploaded Files (${widget.uploadedFiles.length})',
          style: AppTextStyles.bodyMedium.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: 12.h),

        // Files List
        ...widget.uploadedFiles.map(
          (file) =>
              FileItemWidget(file: file, onRemove: () => _removeFile(file)),
        ),
      ],
    );
  }

  void _removeFile(UploadedFile file) {
    final updatedFiles = List<UploadedFile>.from(widget.uploadedFiles);
    updatedFiles.remove(file);
    widget.onFilesChanged(updatedFiles);
  }
}
