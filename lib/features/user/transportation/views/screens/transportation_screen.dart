import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:safe_steps/core/components/custom_elevated_button.dart';
import 'package:safe_steps/core/helper/show_clipper_dialog.dart';
import 'package:safe_steps/core/utilies/assets/images/app_images.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:safe_steps/core/utilies/styles/app_text_styles.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/features/user/medicine_scheduled/views/widgets/custom_app_bar.dart';
import 'package:safe_steps/features/user/transportation/view_models/cubit/transportation_cubit.dart';

class TransportationScreen extends StatefulWidget {
  const TransportationScreen({super.key});

  @override
  State<TransportationScreen> createState() => _TransportationScreenState();
}

class _TransportationScreenState extends State<TransportationScreen> {
  late final TextEditingController fromController;
  late final TextEditingController toController;
  late final TextEditingController priceController;
  String price = '';

  @override
  void initState() {
    super.initState();
    fromController = TextEditingController();
    toController = TextEditingController();
    priceController = TextEditingController();
  }

  @override
  void dispose() {
    fromController.dispose();
    toController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = TransportationCubit();
        debugPrint('TransportationCubit created');
        return cubit;
      },
      child: Scaffold(
        appBar: const CustomAppBar(title: "Transportation"),
        body: Padding(
          padding: EdgeInsets.all(SizeConfig.width * 0.04),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      SizeConfig.width * 0.04,
                    ),
                    side: BorderSide(color: AppColors.kThirdColor, width: 1.5),
                  ),
                  child: Image.asset(
                    AppImages.mapImage,
                    height: SizeConfig.height * 0.3,
                    width: double.infinity,
                  ),
                ),
                SizedBox(height: SizeConfig.height * 0.02),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.width * 0.04),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.width * 0.04),
                    child: SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: SizeConfig.height * 0.5,
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // FROM Field
                              _SearchField(
                                controller: fromController,
                                label: 'From',
                                hint: 'Enter start location',
                                icon: const Icon(Icons.circle,
                                    color: Colors.green, size: 16),
                                isFrom: true,
                              ),
                              SizedBox(height: SizeConfig.height * 0.02),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: SizeConfig.width * 0.1),
                                child: Dash(
                                  direction: Axis.vertical,
                                  length: SizeConfig.height * 0.05,
                                  dashLength: 6,
                                  dashColor: Colors.grey.shade400,
                                ),
                              ),
                              SizedBox(height: SizeConfig.height * 0.02),

                              // TO Field
                              _SearchField(
                                controller: toController,
                                label: 'To',
                                hint: 'Enter destination',
                                icon: const Icon(Icons.location_on,
                                    color: Colors.red, size: 20),
                                isFrom: false,
                              ),
                              SizedBox(height: SizeConfig.height * 0.02),

                              // Price Field
                              _PriceField(
                                controller: priceController,
                                onChanged: (value) {
                                  setState(() {
                                    price = value;
                                  });
                                },
                              ),
                              SizedBox(height: SizeConfig.height * 0.02),

                              // Selected Destinations and Confirm Button
                              _ConfirmSection(
                                fromController: fromController,
                                toController: toController,
                                price: price,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final Widget icon;
  final bool isFrom;

  const _SearchField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    required this.isFrom,
  });

  @override
  State<_SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<_SearchField> {
  final OverlayPortalController overlayController = OverlayPortalController();
  final FocusNode focusNode = FocusNode();
  final GlobalKey textFieldKey = GlobalKey();
  String lastQuery = '';
  bool shouldShowOverlay = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    focusNode.removeListener(_handleFocusChange);
    focusNode.dispose();
    overlayController.hide();
    super.dispose();
  }

  void _handleFocusChange() {
    if (!focusNode.hasFocus) {
      overlayController.hide();
      shouldShowOverlay = false;
    }
  }

  void _handleTextChange(String value) {
    lastQuery = value;
    if (value.length >= 2) {
      context
          .read<TransportationCubit>()
          .fetchDestinationSuggestions(query: value, isFrom: widget.isFrom);
      shouldShowOverlay = true;
      overlayController.show();
    } else {
      context
          .read<TransportationCubit>()
          .clearSuggestions(isFrom: widget.isFrom);
      shouldShowOverlay = false;
      overlayController.hide();
    }
  }

  void _onSuggestionTap(Map<String, dynamic> suggestion) {
    widget.controller.text = suggestion['name'];
    if (widget.isFrom) {
      context.read<TransportationCubit>().setFromDestination(suggestion);
    } else {
      context.read<TransportationCubit>().setToDestination(suggestion);
    }
    context.read<TransportationCubit>().clearSuggestions(isFrom: widget.isFrom);
    overlayController.hide();
    focusNode.unfocus();
    shouldShowOverlay = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            widget.icon,
            SizedBox(width: SizeConfig.width * 0.02),
            Expanded(
              child: OverlayPortal(
                controller: overlayController,
                overlayChildBuilder: (context) => _buildOverlayContent(),
                child: TextField(
                  key: textFieldKey,
                  controller: widget.controller,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    labelText: widget.label,
                    hintText: widget.hint,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.width * 0.04,
                      vertical: SizeConfig.height * 0.02,
                    ),
                  ),
                  onChanged: _handleTextChange,
                  onTap: () {
                    focusNode.requestFocus();
                    if (widget.controller.text.length >= 2) {
                      _handleTextChange(widget.controller.text);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOverlayContent() {
    final RenderBox? renderBox =
        textFieldKey.currentContext?.findRenderObject() as RenderBox?;
    final position = renderBox?.localToGlobal(Offset.zero) ?? Offset.zero;
    final size = renderBox?.size ?? Size.zero;

    if (!shouldShowOverlay) {
      return const SizedBox.shrink();
    }

    return Positioned(
      top: position.dy + size.height + 8,
      left: position.dx,
      width: size.width,
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: SizeConfig.height * 0.3,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: BlocBuilder<TransportationCubit, TransportationState>(
            builder: (context, state) {
              List<Map<String, dynamic>> suggestions = [];
              bool isLoading = false;
              String? errorMessage;
              bool isTooShort = false;

              if (widget.isFrom) {
                if (state is DestinationFromSuggestionsLoaded) {
                  suggestions = state.suggestions.take(5).toList();
                } else if (state is DestinationFromSuggestionsLoading) {
                  isLoading = true;
                } else if (state is DestinationFromSuggestionsEmpty) {
                  suggestions = [];
                } else if (state is DestinationFromSuggestionsTooShort) {
                  isTooShort = true;
                } else if (state is DestinationSuggestionsError) {
                  errorMessage = state.errorMessage;
                }
              } else {
                if (state is DestinationToSuggestionsLoaded) {
                  suggestions = state.suggestions.take(5).toList();
                } else if (state is DestinationToSuggestionsLoading) {
                  isLoading = true;
                } else if (state is DestinationToSuggestionsEmpty) {
                  suggestions = [];
                } else if (state is DestinationToSuggestionsTooShort) {
                  isTooShort = true;
                } else if (state is DestinationSuggestionsError) {
                  errorMessage = state.errorMessage;
                }
              }

              if (isTooShort) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Please enter at least 2 characters",
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }

              if (isLoading) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (errorMessage != null) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Error: $errorMessage",
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }

              if (suggestions.isEmpty && lastQuery.isNotEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "No suggestions found.",
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: suggestions.length,
                itemBuilder: (context, index) {
                  final suggestion = suggestions[index];
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade200),
                      ),
                    ),
                    child: ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.width * 0.04,
                        vertical: SizeConfig.height * 0.005,
                      ),
                      title: Text(
                        suggestion['name'],
                        style: AppTextStyles.title16PrimaryColorW500?.copyWith(
                              color: AppColors.kThirdColor ?? Colors.black,
                            ) ??
                            const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                      ),
                      onTap: () => _onSuggestionTap(suggestion),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class _PriceField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const _PriceField({
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.attach_money,
            color: AppColors.kPrimaryColor ?? Colors.blue, size: 20),
        SizedBox(width: SizeConfig.width * 0.02),
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: 'Price',
              hintText: 'Enter price (e.g., 100)',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.grey.shade50,
              contentPadding: EdgeInsets.symmetric(
                horizontal: SizeConfig.width * 0.04,
                vertical: SizeConfig.height * 0.02,
              ),
            ),
            keyboardType: TextInputType.number,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

class _ConfirmSection extends StatelessWidget {
  final TextEditingController fromController;
  final TextEditingController toController;
  final String price;

  const _ConfirmSection({
    required this.fromController,
    required this.toController,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransportationCubit, TransportationState>(
      listener: (context, state) {
        debugPrint('Transportation state: $state');
      },
      builder: (context, state) {
        final cubit = context.read<TransportationCubit>();
        final selectedFrom = cubit.selectedFromDestination;
        final selectedTo = cubit.selectedToDestination;
        final isConfirmEnabled =
            selectedFrom != null && selectedTo != null && price.isNotEmpty;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (selectedFrom != null)
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: SizeConfig.height * 0.01),
                child: Text(
                  'From: ${selectedFrom['name']}',
                  style: AppTextStyles.title16PrimaryColorW500
                      .copyWith(color: AppColors.kThirdColor),
                ),
              ),
            if (selectedTo != null)
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: SizeConfig.height * 0.01),
                child: Text(
                  'To: ${selectedTo['name']}',
                  style: AppTextStyles.title16PrimaryColorW500
                      .copyWith(color: AppColors.kThirdColor),
                ),
              ),
            SizedBox(height: SizeConfig.height * 0.02),
            Center(
              child: CustomElevatedButton(
                name: "Find Driver",
                backgroundColor: AppColors.kThirdColor,
                onPressed: isConfirmEnabled
                    ? () {
                        _showConfirmationDialog(
                            context, selectedFrom, selectedTo);
                      }
                    : null,
              ),
            ),
          ],
        );
      },
    );
  }

  void _showConfirmationDialog(
    BuildContext context,
    Map<String, dynamic> selectedFrom,
    Map<String, dynamic> selectedTo,
  ) {
    Navigator.of(context).pop();
    showCustomClipperDialog(
      message: "",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Trip Details:',
            style: AppTextStyles.title16PrimaryColorW500
                .copyWith(color: AppColors.kPrimaryColor),
          ),
          SizedBox(height: SizeConfig.height * 0.01),
          Text(
            '• From: ${selectedFrom['name']}',
            style: TextStyle(fontSize: 16, color: Colors.grey[800]),
          ),
          Text(
            '• To: ${selectedTo['name']}',
            style: TextStyle(fontSize: 16, color: Colors.grey[800]),
          ),
          Text(
            '• Price: $price',
            style: TextStyle(fontSize: 16, color: Colors.grey[800]),
          ),
        ],
      ),
      title: "Success",
    );
  }
}
