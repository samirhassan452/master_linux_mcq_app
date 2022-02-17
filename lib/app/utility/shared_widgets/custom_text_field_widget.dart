import 'package:master_linux_mcq_app/app/utility/utility_exports.dart'
    show
        AppColors,
        BORDER_TYPE,
        Constants,
        CustomHorizontalSpace,
        CustomPopUpsWidgets,
        CustomVerticalSpace;
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  // if app in different languages, pass the key to search about word
  final String label;
  final Color labelColor;
  final double labelSize;
  final TextAlign labelTextAlign;
  final bool isRequired;

  final bool filled;
  final Color fillColor;
  final double borderWidth;
  final double borderRadius;
  final Color borderColor;
  final BORDER_TYPE borderType;

  final TextEditingController controller;
  final FocusNode? focusNode;
  final double textFieldHeight;
  final bool autoCorrect;
  final bool readOnly;
  final Color cursorColor;
  final TextAlign textFieldAlign;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final TextAlignVertical textAlignVertical;
  final TextInputAction? textInputAction;
  final bool obsecureText;
  final TextStyle? textFieldStyle;
  final double contentVerticalPadding;
  final double contentHorizontalPadding;
  final String hintText;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double prefixSize;
  final double suffixSize;
  final int errorMaxLines;
  final double spacerSize;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final VoidCallback? onTap;
  const CustomTextFieldWidget({
    Key? key,
    required this.label,
    this.labelColor = AppColors.darkTurquoise,
    this.labelSize = 14.0,
    this.labelTextAlign = TextAlign.start,
    this.isRequired = true,
    this.filled = true,
    this.fillColor = AppColors.white2,
    this.borderWidth = 1.2,
    this.borderRadius = 2.0,
    this.borderColor = AppColors.warmGrey,
    this.borderType = BORDER_TYPE.outline,
    required this.controller,
    this.focusNode,
    this.textFieldHeight = 60.0,
    this.autoCorrect = true,
    this.readOnly = false,
    this.cursorColor = AppColors.darkGreen,
    this.textFieldAlign = TextAlign.start,
    this.keyboardType,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.textAlignVertical = TextAlignVertical.center,
    this.textInputAction = TextInputAction.done,
    this.obsecureText = false,
    this.textFieldStyle,
    this.contentHorizontalPadding = 0,
    this.contentVerticalPadding = Constants.semiSmallPadding - 4,
    this.hintText = '',
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixSize = 25.0,
    this.suffixSize = 25.0,
    this.errorMaxLines = 2,
    this.spacerSize = 30.0,
    this.onFieldSubmitted,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // label
        if (label.isNotEmpty)
          RichText(
            textAlign: labelTextAlign,
            text: TextSpan(
              text: label,
              style: TextStyle(
                color: labelColor,
                fontSize: labelSize,
                fontWeight: FontWeight.w500,
              ),
              children: [
                if (isRequired)
                  const TextSpan(
                    text: '*',
                    style: TextStyle(color: AppColors.redBrown),
                  ),
              ],
            ),
          ),
        if (label.isNotEmpty) Constants.verticalSpaceSmall,
        /* CustomTextWidget(
            label,
            fontColor: labelColor,
            fontSize: labelSize,
            textAlign: labelTextAlign,
          ), */
        LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              children: [
                // prefix
                if (prefixIcon != null)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomHorizontalSpace(width: 5.0),
                      SizedBox(
                        width: prefixSize,
                        height: prefixSize,
                        child: FittedBox(child: prefixIcon),
                      ),
                      const CustomHorizontalSpace(width: 5.0),
                    ],
                  ),
                // text field
                SizedBox(
                  width: _getTextFieldWidth(constraints.maxWidth),
                  child: TextFormField(
                    controller: controller,
                    focusNode: focusNode ?? FocusNode(),
                    autocorrect: autoCorrect,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    readOnly: readOnly,
                    cursorColor: cursorColor,
                    keyboardType: keyboardType,
                    maxLines: obsecureText ? 1 : maxLines,
                    maxLength: maxLength,
                    minLines: obsecureText ? 1 : minLines,
                    obscureText: obsecureText,
                    textAlignVertical: textAlignVertical,
                    textInputAction: textInputAction,
                    style: textFieldStyle ??
                        const TextStyle(
                          fontSize: 17.0,
                          color: AppColors.black,
                          letterSpacing: 0.5,
                        ),
                    decoration: InputDecoration(
                        // isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: Constants.semiMediumPadding,
                        ),
                        // counter: const SizedBox(),
                        hintText: hintText,
                        hintStyle: hintStyle ??
                            const TextStyle(
                              fontSize: 17.0,
                              color: AppColors.black3,
                              letterSpacing: 0.5,
                            ),
                        filled: filled,
                        fillColor: readOnly ? AppColors.black4 : fillColor,
                        enabledBorder: _getBorder(borderColor),
                        focusedBorder: _getBorder(borderColor),
                        errorBorder: _getBorder(AppColors.redBrown),
                        focusedErrorBorder: _getBorder(AppColors.redBrown),
                        errorMaxLines: errorMaxLines,
                        errorStyle: const TextStyle(color: AppColors.redBrown)),
                    onChanged: onChanged,
                    onFieldSubmitted: onFieldSubmitted,
                    validator: (value) => validator!(value),
                    onSaved: onSaved,
                    onTap: readOnly
                        ? () => CustomPopUpsWidgets.showWarningMessageDialog(
                              "This field read onyl.",
                            )
                        : onTap,
                  ),
                ),
                // suffix
                if (suffixIcon != null)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomHorizontalSpace(width: 5.0),
                      SizedBox(
                        width: suffixSize,
                        height: suffixSize,
                        child: FittedBox(child: suffixIcon),
                      ),
                      const CustomHorizontalSpace(width: 5.0),
                    ],
                  ),
              ],
            );
          },
        ),
        CustomVerticalSpace(height: spacerSize),
      ],
    );
  }

  InputBorder _getBorder(Color borderColor) {
    switch (borderType) {
      case BORDER_TYPE.none:
        return InputBorder.none;
      case BORDER_TYPE.outline:
        return OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor, width: borderWidth),
        );
      case BORDER_TYPE.underline:
        return UnderlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: borderColor, width: borderWidth),
        );
    }
  }

  double _getTextFieldWidth(double width) {
    if (suffixIcon != null && prefixIcon != null) {
      // 35.0 for prefix & 35.0 for
      // 5 space + 25 width + 5 space
      return width - (10.0 + 10.0 + suffixSize + prefixSize);
    } else if (suffixIcon != null && prefixIcon == null) {
      return width - (10.0 + suffixSize);
    } else if (suffixIcon == null && prefixIcon != null) {
      return width - (10.0 + prefixSize);
    } else {
      return width;
    }
  }
}
