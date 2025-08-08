

class BlogFormItem {

  final String value;
  final String? error;

  BlogFormItem({
    this.value = '',
    this.error,
  });


  BlogFormItem copyWith({
    String? value,
    String? error
  }) {
    return BlogFormItem(
      value: value ?? this.value,
      error: error ?? this.error
    );
  }

}