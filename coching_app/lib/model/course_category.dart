enum CourseCategory { all, programming, marketing, finance, other }

extension CourseCategoryExtenstion on CourseCategory {
  String get title {
    switch (this) {
      case CourseCategory.all:
        return 'All';
      case CourseCategory.programming:
        return 'programming';
      case CourseCategory.marketing:
        return 'marketing';
      case CourseCategory.finance:
        return 'finance';
      case CourseCategory.other:
        return 'other';
    }
  }
}
