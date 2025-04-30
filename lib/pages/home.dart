import 'package:flutter/material.dart';
import 'package:news_app/models/artical_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/pages/article_view.dart';
import 'package:news_app/pages/category_news.dart';
import 'package:news_app/services/data.dart';
import 'package:news_app/services/news.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<ArticalModel> articles = [];
  bool loading = true;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(248, 255, 255, 255),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 40.0, left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text(
                        "Flash",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: const Color.fromARGB(255, 86, 241, 167),
                        ),
                      ),
                      const Text("Feed",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                              color: Colors.black))
                    ]),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text("Hottest News",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 22.0,
                            color: Colors.black)),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 2.55,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: articles.length,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ArticleView(
                                            blogUrl: articles[index].url!,
                                          )));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  bottom: 3.0, left: 15.0),
                              child: Material(
                                elevation: 2.0,
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image.network(
                                                articles[index].urlToImage ??
                                                    '',
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2,
                                                fit: BoxFit.cover,
                                                height: 120.0,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return Image.asset(
                                                    'images/image-not-found.png', // Add a local image in your assets
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    fit: BoxFit.cover,
                                                    height: 120.0,
                                                  );
                                                },
                                              )),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.8,
                                          child: Text(
                                            maxLines: 2,
                                            articles[index].title!,
                                            // textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 5.0, right: 5.0),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.8,
                                          child: Text(
                                            maxLines: 3,
                                            articles[index].description!,
                                            // textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color:
                                                  Color.fromARGB(188, 0, 0, 0),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          width: 80,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 86, 241, 167),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20.0),
                                                bottomRight:
                                                    Radius.circular(10)),
                                          ),
                                          margin: EdgeInsets.only(right: 10.0),
                                          child: Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                            size: 30.0,
                                          ),
                                        )
                                      ],
                                    )),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text("Explore",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 22.0,
                            color: Colors.black)),
                    Container(
                      height: 150,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                              categoryname: categories[index].categoryName,
                              image: categories[index].image,
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text("Trending News",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 22.0,
                            color: Colors.black)),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 40.0),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: articles.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ArticleView(
                                              blogUrl: articles[index].url!,
                                            )));
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 20, right: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)),
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomLeft: Radius.circular(10)),
                                      child: Image.network(
                                        articles[index].urlToImage!,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                            'images/image-not-found.png', // Add a local image in your assets
                                            // width: MediaQuery.of(context).size.width,
                                            fit: BoxFit.cover,
                                            height: 120.0,
                                            width: 120,
                                          );
                                        },
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.7,
                                          child: Text(
                                              maxLines: 2,
                                              articles[index].title!,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18.0,
                                                  color: const Color.fromARGB(
                                                      181, 0, 0, 0))),
                                        ),
                                        const SizedBox(
                                          height: 5.0,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 5.0, right: 5.0, bottom: 1),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.7,
                                          child: Text(
                                              maxLines: 3,
                                              articles[index].description!,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15.0,
                                                  color: const Color.fromARGB(
                                                      151, 0, 0, 0))),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final image, categoryname;
  const CategoryTile({super.key, this.image, this.categoryname});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryNews(
              name: categoryname,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 20),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  image,
                  height: 120,
                  width: 120,
                  fit: BoxFit.cover,
                )),
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(60)),
            ),
            Container(
              height: 120,
              width: 120,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(60)),
              child: Center(
                child: Text(
                  categoryname,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
