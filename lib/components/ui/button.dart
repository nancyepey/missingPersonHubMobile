
import 'package:flutter/material.dart';
import 'package:missingpeoplehub/resources/app_styles.dart';
import 'package:missingpeoplehub/core/config/app_colors.dart';


class ButtonComponent extends StatefulWidget {
  final double? width;
  final String label;
  final Widget? icon;
  final ButtonType type;
  final Function() onPressed;
  final bool isLoading;

  const ButtonComponent({super.key, required this.label, this.icon, this.type = ButtonType.primary, this.width, required this.onPressed, this.isLoading = false});

  @override
  State<ButtonComponent> createState() => _ButtonComponentState();
}

class _ButtonComponentState extends State<ButtonComponent> {

  //create a map for btn background color based on button type
  final Map<ButtonType, Color> backgroundColour = {
    ButtonType.primary: AppColors.primaryColour,
    ButtonType.secondary: AppColors.primarylightColour,
    ButtonType.light : Colors.white,
  };

  //create a map for btn foreground color based on button type
  final Map<ButtonType, Color> foregroundColour = {
    ButtonType.primary: Colors.white,
    ButtonType.secondary: AppColors.primaryColour,
    ButtonType.light : Colors.black,
  };

  //create a map for btn border color based on button type
  final Map<ButtonType, Color> borderColour = {
    ButtonType.primary: AppColors.primaryColour,
    ButtonType.secondary: AppColors.primarylightColour,
    ButtonType.light : AppColors.light20Colour.withOpacity(0.5),
  };


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: widget.width ?? MediaQuery.of(context).size.width, //if width is passed used it if not used default screen size width
      child: ElevatedButton(

        onPressed: (){
          if(!widget.isLoading) widget.onPressed();
        },

        style: ElevatedButton.styleFrom(
          elevation:0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: borderColour[widget.type]!,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          //foregroundColor: widget.type == ButtonType.secondary ? AppColors.primaryColour : Colors.white,
          //backgroundColor: widget.type == ButtonType.secondary ? AppColors.primarylightColour : AppColors.primaryColour
          backgroundColor: backgroundColour[widget.type],
        ),
        child: widget.isLoading ? CircularProgressIndicator(
          color: foregroundColour[widget.type],
        ) : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(widget.icon != null) widget.icon!,
            Text(
              widget.label,
              style: AppStyles.title3(
                //color: widget.type == ButtonType.secondary ? AppColors.primaryColour : Colors.white,
                  color: foregroundColour[widget.type]!
              ),

            ),
          ],
        ),
      ),
    );
  }

}

enum ButtonType {
  primary,
  secondary,
  light
}


