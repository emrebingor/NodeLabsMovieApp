import 'package:flutter/material.dart';
import 'package:node_labs_movie_app/utils/extension/color_extension.dart';

typedef PaginatedIndexBuilder<T extends Object> = Widget Function(BuildContext context, T item);

final class PaginationBuilder<T extends Object> extends StatefulWidget {
  PaginationBuilder({
    super.key,
    required this.source,
    required this.paginationCallback,
    required this.itemBuilder,
    required this.isHaveMoreData,
    required this.gridDelegate,
    this.scroll,
    this.padding,
  }) : assert(T != dynamic);

  final List<T> source;
  final Future<void> Function() paginationCallback;
  final PaginatedIndexBuilder<T> itemBuilder;
  final bool isHaveMoreData;
  final ScrollPhysics? scroll;

  final SliverGridDelegate gridDelegate;

  final EdgeInsetsGeometry? padding;

  @override
  State<PaginationBuilder<T>> createState() => _PaginationBuilderState<T>();
}

final class _PaginationBuilderState<T extends Object> extends State<PaginationBuilder<T>> with _PaginationMixin<T> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: widget.padding,
      physics: widget.scroll,
      controller: _scrollController,
      gridDelegate: widget.gridDelegate,
      itemCount: widget.source.length + (widget.isHaveMoreData ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == widget.source.length) {
          return _CircularProgressIndicator();
        }
        return widget.itemBuilder(context, widget.source[index]);
      },
    );
  }
}

class _CircularProgressIndicator extends StatelessWidget {
  const _CircularProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: CircularProgressIndicator(
          color: ColorExtension.white,
        ),
      ),
    );
  }
}

mixin _PaginationMixin<T extends Object> on State<PaginationBuilder<T>> {
  late final ScrollController _scrollController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _buildListener(_scrollController);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _buildListener(ScrollController scrollController) {
    scrollController.addListener(() async {
      if (_isNotReadyToPaginate(scrollController)) return;
      _changeLoading();
      await widget.paginationCallback();
      _changeLoading();
    });
  }

  void _changeLoading() {
    if (!mounted) return;
    _isLoading = !_isLoading;
    setState(() {});
  }

  bool _isNotReadyToPaginate(ScrollController scrollController) {
    if (scrollController.position.pixels != scrollController.position.maxScrollExtent) {
      return true;
    }
    if (_isLoading) return true;
    if (!widget.isHaveMoreData) return true;
    return false;
  }
}
