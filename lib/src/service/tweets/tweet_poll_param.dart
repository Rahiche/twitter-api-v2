// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

/// The object that contains options for a Tweet with a poll.
///
/// This is mutually exclusive from Media and Quote Tweet ID.
class TweetPollParam {
  /// Returns the new instance of [TweetPollParam].
  TweetPollParam({required this.durationInMinute, required this.options});

  /// Duration of the poll in minutes for a Tweet with a poll.
  final int durationInMinute;

  /// A list of poll options for a Tweet with a poll.
  final List<String> options;
}
