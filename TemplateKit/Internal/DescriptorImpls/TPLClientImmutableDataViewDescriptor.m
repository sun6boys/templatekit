/*
 * Copyright 2016 Google Inc. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "Internal/DescriptorImpls/TPLClientImmutableDataViewDescriptor.h"


@implementation TPLClientImmutableDataViewDescriptor

- (void)setAdapter:(id<TPLImmutableDataViewAdapter>)adapter {
  _adapter = adapter;
  if ([_adapter respondsToSelector:@selector(activatedControlEvents)]) {
    self.activatedControlEvents = [_adapter activatedControlEvents];
  }
}

- (UIView *)uninitializedView {
  return [[UIView alloc] init];
}

- (void)setData:(id)data toView:(UIView *)view {
  UIView *contentView = [_adapter viewWithData:data];
  contentView.frame = view.bounds;
  contentView.autoresizingMask =
      UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [view addSubview:contentView];
}

- (CGSize)viewSizeThatFits:(CGSize)size withData:(id)data {
  return [_adapter viewSizeThatFits:size withData:data];
}

@end
