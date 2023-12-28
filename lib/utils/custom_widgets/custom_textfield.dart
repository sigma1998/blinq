// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final String? Function(String?)? validate;
  final String? hint;
  final String? labelText;
  final String? tvHeading;
  final double? height;
  final double? width;
  final double? radius;
  final Color? color;
  final Color? courserColor;
  final TextStyle? hintStyle;
  final EdgeInsets? contentPadding;
  final TextInputType? inputType;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextEditingController? textController;
  final FocusNode? focusNode;
  final Function(String value)? onFieldSubmitted;
  final Function()? onTap;
  final TextInputAction? inputAction;
  final bool? hideBorder;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxline;
  final InputBorder? decoration;
  final Color? fillColor;
  final int? minLine;
  final int? maxLength;
  final bool readOnly;
  final bool? shadow;
  final bool? obscure;
  final bool? isOutined;
  final Function(String value)? onChange;
  final List<TextInputFormatter>? inputFormatter;
  final Color? errorColor;
  final Color? underLineColor;
  final String? initialValue;
  final InputBorder? enabledBorder;
  final Color? labelColor;
  final TextStyle? labelStyle;
  final bool? isIcon;
  final String? imageUrl;

  const TextFieldWidget({
    super.key,
    this.hint,
    this.labelText,
    this.validate,
    this.tvHeading,
    this.inputType,
    this.textController,
    this.hintStyle,
    this.courserColor,
    this.onChange,
    this.decoration,
    this.imageUrl,
    this.labelStyle,
    this.isIcon = false,
    this.fillColor,
    this.radius,
    this.focusNode,
    this.readOnly = false,
    this.shadow,
    this.labelColor,
    this.floatingLabelBehavior,
    this.onFieldSubmitted,
    this.inputAction,
    this.height,
    this.width,
    this.contentPadding,
    this.isOutined = false,
    this.maxline = 1,
    this.minLine = 1,
    this.maxLength,
    this.color,
    this.hideBorder = true,
    this.suffixIcon,
    this.prefixIcon,
    this.obscure,
    this.onTap,
    this.inputFormatter,
    this.initialValue,
    this.enabledBorder,
    this.errorColor,
    this.underLineColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            isIcon == false
                ? const SizedBox(
                    height: 0,
                    width: 0,
                  )
                : Image.asset(imageUrl ?? '', height: 30),
            Expanded(
                child: Text(labelText ?? '',
                    textAlign: TextAlign.start,
                    style:
                        labelStyle ?? Theme.of(context).textTheme.bodyMedium)),
          ],
        ),
        TextFormField(
            readOnly: readOnly,
            onTap: onTap,
            initialValue: initialValue,
            obscureText: obscure ?? false,
            controller: textController,
            focusNode: focusNode,
            validator: validate,
            keyboardType: inputType,
            maxLength: maxLength,
            onChanged: onChange,
            cursorColor: courserColor,
            inputFormatters: inputFormatter ??
                [
                  FilteringTextInputFormatter(
                      RegExp(
                          '(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'),
                      allow: false),
                ],
            maxLines: maxline,
            minLines: minLine,
            textInputAction: inputAction,
            obscuringCharacter: '*',
            onFieldSubmitted: onFieldSubmitted,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: inputDecoration(context)),
      ],
    );
  }

  inputDecoration(context) => InputDecoration(
        counterText: "",
        errorMaxLines: 2,
        errorStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: errorColor ?? Colors.red),
        enabledBorder: enabledBorder,
        border: enabledBorder,
        disabledBorder: enabledBorder,
        focusedBorder: enabledBorder,
        contentPadding:
            contentPadding ?? const EdgeInsets.symmetric(vertical: 10),
        prefixIcon: prefixIcon,
        suffixIcon: isOutined == true ? null : suffixIcon,
        hintText: hint,
        hintStyle: hintStyle ??
            Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.grey),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        isDense: true,
        fillColor: fillColor ?? Colors.transparent,
      );
}

class TextFieldRoundedWidget extends StatelessWidget {
  final String? hint;
  final String? Function(String?)? validate;

  final TextInputType? inputType;
  final TextEditingController? textController;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final TextInputAction? inputAction;
  final bool? readOnly;
  final String? labelText;

  final bool? obscureText;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? prefixes;
  final int? maxLines;
  final int? minLines;
  final bool? isAccountOverview;
  final List<TextInputFormatter>? inputFormat;
  final double radius;
  final int? maxLength;
  final GestureTapCallback? ontap;
  final List? inputFormatters;
  final String? initialValue;

  const TextFieldRoundedWidget(
      {Key? key,
      this.hint,
      this.inputType,
      this.textController,
      this.radius = 10.0,
      this.focusNode,
      this.obscureText,
      this.inputFormatters,
      this.suffix,
      this.validate,
      this.prefix,
      this.prefixes,
      this.maxLines,
      this.minLines,
      this.onFieldSubmitted,
      this.isAccountOverview,
      this.inputFormat,
      this.ontap,
      this.onChanged,
      this.readOnly = false,
      this.inputAction,
      this.labelText,
      this.maxLength,
      this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      TextFormField(
          cursorColor: Colors.grey,
          readOnly: readOnly!,
          controller: textController,
          maxLines: maxLines ?? 1,
          obscureText: obscureText ?? false,
          minLines: minLines ?? 1,
          focusNode: focusNode,
          keyboardType: inputType,
          onTap: ontap,
          initialValue: initialValue,
          maxLength: maxLength,
          onChanged: onChanged,
          textInputAction: inputAction,
          validator: validate,
          obscuringCharacter: "*",
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
          inputFormatters: inputFormat,
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
            errorMaxLines: 3,
            filled: true,
            hintText: hint,
            counterText: '',
            hintStyle:
                Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
            suffixIcon: suffix,
            prefixIcon: prefix,
            prefix: prefixes,
            suffixIconConstraints:
                const BoxConstraints(minHeight: 25, minWidth: 25),
            errorStyle: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontSize: 10, color: Colors.red),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.outline, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(radius))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.outline, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(radius))),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(radius))),
          )),
    ]);
  }
}
