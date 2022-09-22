// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// Dart imports:
import 'dart:io';

// Package imports:
import 'package:test/test.dart';
import 'package:twitter_api_core/twitter_api_core.dart';

// Project imports:
import 'package:twitter_api_v2/src/service/media/media_service.dart';
import 'package:twitter_api_v2/src/service/media/uploaded_media_data.dart';
import '../../../mocks/client_context_stubs.dart' as context;
import '../common_expectations.dart';

void main() {
  group('.uploadImage', () {
    test('normal case', () async {
      final mediaService = MediaService(
        context: context.buildPostMultipartStub(
          UserContext.oauth1Only,
          '/1.1/media/upload.json',
          'test/src/service/media/data/upload_image.json',
        ),
      );

      final response = await mediaService.uploadImage(
        file: File.fromUri(
          Uri.file('test/src/service/media/data/upload_image.json'),
        ),
      );

      expect(response.data, isA<UploadedMediaData>());
      expect(response.data.mediaId, '710511363345354753');
    });

    test('with invalid oauth token', () async {
      final mediaService = MediaService(
        context: ClientContext(
          bearerToken: 'xxxx',
          timeout: const Duration(seconds: 10),
        ),
      );

      expectUnauthorizedExceptionForOAuth1(
        () async => await mediaService.uploadImage(
          file: File.fromUri(
            Uri.file('test/src/service/media/data/upload_image.json'),
          ),
        ),
      );
    });
  });
}