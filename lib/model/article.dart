import 'package:flutter_app/model/dataarticle.dart';

class Article {

  final bool error;
  final String message;
  final List<DataArticle> data;

	Article.fromJsonMap(Map<String, dynamic> map): 
		error = map["error"],
		message = map["message"],
		data = List<DataArticle>.from(map["data"].map((it) => DataArticle.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['error'] = error;
		data['message'] = message;
		data['data'] = data != null ? 
			this.data.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
