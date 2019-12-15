
class DataArticle {
  final int id;
  final String title;
  final String article;
  final String img;
  final String created_at;
  final String updated_at;
  final Object deleted_at;

	DataArticle.fromJsonMap(Map<String, dynamic> map):
		id = map["id"],
		title = map["title"],
		article = map["article"],
		img = map["img"],
		created_at = map["created_at"],
		updated_at = map["updated_at"],
		deleted_at = map["deleted_at"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = id;
		data['title'] = title;
		data['article'] = article;
		data['img'] = img;
		data['created_at'] = created_at;
		data['updated_at'] = updated_at;
		data['deleted_at'] = deleted_at;
		return data;
	}
}
