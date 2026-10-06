//
//  JobsOCDSL.h
//  JobsOCDSL
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsOCDSL_h
#define JobsOCDSL_h

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDSL/NSMutableParagraphStyle+DSL.h>)
#import <JobsOCDSL/NSMutableParagraphStyle+DSL.h>
#define JOBS_OCDSL_HAS_PARAGRAPH_STYLE 1
#else
#define JOBS_OCDSL_HAS_PARAGRAPH_STYLE 0
#endif

#if __has_include(<JobsOCDSL/UICollectionView+DSL.h>)
#import <JobsOCDSL/UICollectionView+DSL.h>
#define JOBS_OCDSL_HAS_COLLECTION_VIEW 1
#else
#define JOBS_OCDSL_HAS_COLLECTION_VIEW 0
#endif

#if __has_include(<JobsOCDSL/UIControl+DSL.h>)
#import <JobsOCDSL/UIControl+DSL.h>
#define JOBS_OCDSL_HAS_CONTROL 1
#else
#define JOBS_OCDSL_HAS_CONTROL 0
#endif

#if __has_include(<JobsOCDSL/UIProgressView+DSL.h>)
#import <JobsOCDSL/UIProgressView+DSL.h>
#define JOBS_OCDSL_HAS_PROGRESS_VIEW 1
#else
#define JOBS_OCDSL_HAS_PROGRESS_VIEW 0
#endif

#if __has_include(<JobsOCDSL/UITableView+DSL.h>)
#import <JobsOCDSL/UITableView+DSL.h>
#define JOBS_OCDSL_HAS_TABLE_VIEW 1
#else
#define JOBS_OCDSL_HAS_TABLE_VIEW 0
#endif

#if __has_include(<JobsOCDSL/UIView+DSL.h>)
#import <JobsOCDSL/UIView+DSL.h>
#define JOBS_OCDSL_HAS_VIEW 1
#else
#define JOBS_OCDSL_HAS_VIEW 0
#endif

#if __has_include(<JobsOCDSL/ASButtonNode+DSL.h>)
#import <JobsOCDSL/ASButtonNode+DSL.h>
#define JOBS_OCDSL_HAS_AS_BUTTON 1
#else
#define JOBS_OCDSL_HAS_AS_BUTTON 0
#endif

#if __has_include(<JobsOCDSL/ASCollectionNode+DSL.h>)
#import <JobsOCDSL/ASCollectionNode+DSL.h>
#define JOBS_OCDSL_HAS_AS_COLLECTION 1
#else
#define JOBS_OCDSL_HAS_AS_COLLECTION 0
#endif

#if __has_include(<JobsOCDSL/ASEditableTextNode+DSL.h>)
#import <JobsOCDSL/ASEditableTextNode+DSL.h>
#define JOBS_OCDSL_HAS_AS_EDITABLE_TEXT 1
#else
#define JOBS_OCDSL_HAS_AS_EDITABLE_TEXT 0
#endif

#if __has_include(<JobsOCDSL/ASNetworkImageNode+DSL.h>)
#import <JobsOCDSL/ASNetworkImageNode+DSL.h>
#define JOBS_OCDSL_HAS_AS_NETWORK_IMAGE 1
#else
#define JOBS_OCDSL_HAS_AS_NETWORK_IMAGE 0
#endif

#if __has_include(<JobsOCDSL/ASStackLayoutSpec+DSL.h>)
#import <JobsOCDSL/ASStackLayoutSpec+DSL.h>
#define JOBS_OCDSL_HAS_AS_STACK_LAYOUT 1
#else
#define JOBS_OCDSL_HAS_AS_STACK_LAYOUT 0
#endif

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString * const JobsOCDSLDeliveryVersion;
/// 只列出当前 Pod 实际编译交付的分类，空数组表示兼容入口。
FOUNDATION_EXPORT NSArray<NSString *> *JobsOCDSLAvailableCategoryNames(void);

NS_ASSUME_NONNULL_END

#endif /* JobsOCDSL_h */
