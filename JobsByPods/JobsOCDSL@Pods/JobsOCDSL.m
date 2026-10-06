//
//  JobsOCDSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsOCDSL.h"

NSString * const JobsOCDSLDeliveryVersion = @"1.0.1";

NSArray<NSString *> *JobsOCDSLAvailableCategoryNames(void) {
    NSMutableArray<NSString *> *names = NSMutableArray.array;
#if JOBS_OCDSL_HAS_PARAGRAPH_STYLE
    [names addObject:@"NSMutableParagraphStyle+DSL"];
#endif
#if JOBS_OCDSL_HAS_COLLECTION_VIEW
    [names addObject:@"UICollectionView+DSL"];
#endif
#if JOBS_OCDSL_HAS_CONTROL
    [names addObject:@"UIControl+DSL"];
#endif
#if JOBS_OCDSL_HAS_PROGRESS_VIEW
    [names addObject:@"UIProgressView+DSL"];
#endif
#if JOBS_OCDSL_HAS_TABLE_VIEW
    [names addObject:@"UITableView+DSL"];
#endif
#if JOBS_OCDSL_HAS_VIEW
    [names addObject:@"UIView+DSL"];
#endif
#if JOBS_OCDSL_HAS_AS_BUTTON
    [names addObject:@"ASButtonNode+DSL"];
#endif
#if JOBS_OCDSL_HAS_AS_COLLECTION
    [names addObject:@"ASCollectionNode+DSL"];
#endif
#if JOBS_OCDSL_HAS_AS_EDITABLE_TEXT
    [names addObject:@"ASEditableTextNode+DSL"];
#endif
#if JOBS_OCDSL_HAS_AS_NETWORK_IMAGE
    [names addObject:@"ASNetworkImageNode+DSL"];
#endif
#if JOBS_OCDSL_HAS_AS_STACK_LAYOUT
    [names addObject:@"ASStackLayoutSpec+DSL"];
#endif
    return names.copy;
}
