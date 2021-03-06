import 'package:chewie/chewie.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jilnajah/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';

class vid16 extends StatefulWidget {
  @override
  _vid16State createState() => _vid16State();
}

class _vid16State extends State<vid16> {
  bool isteacher=false;

  final fb = FirebaseDatabase.instance.reference().child("Video16");
  List<String>  itemList=new List();

  @override
  Widget build(BuildContext context) {
    currentuser _currentuser = Provider.of<currentuser>(context ,listen:false );
    if (_currentuser.getcurrentuser.isteacher=='true') {
      setState(() {
        isteacher=true;
      });

    }
    return Scaffold(
      appBar: AppBar(
        title:Text("les Videos") ,
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          physics: new BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListView.separated(
                shrinkWrap: true,
                cacheExtent: 1000,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                key: PageStorageKey(widget.key),
                addAutomaticKeepAlives: true,
                itemCount: itemList.isEmpty ? 0 : itemList.length,
                itemBuilder: (BuildContext context, int index) =>
                    Container(
                      width: double.infinity,
                      height: 400,
                      alignment: Alignment.center,
                      child: Container(
                          key: new PageStorageKey(
                            "keydata$index",
                          ),
                          child: VideoWidget(
                              play: true,
                              url: itemList[index]
                          )
                      ),
                    ),
                separatorBuilder: (context, index) {
                  return Divider();
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: isteacher,
        child: FloatingActionButton(
          onPressed: (){
            uploadToStorage();
          },
          backgroundColor: Colors.amber,
          child: Icon(
            Icons.add,
            size: 40,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
  Future uploadToStorage() async {
    var uuid =Uuid();
    dynamic id=uuid.v1();
    try {

      final file =  await ImagePicker.pickVideo(source: ImageSource.gallery);
      StorageReference ref = FirebaseStorage.instance.ref().child("video").child(id);
      StorageUploadTask uploadTask = ref.putFile(file, StorageMetadata(contentType: 'video/mp4'));
      var storageTaskSnapshot = await uploadTask.onComplete;
      var downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
      final String url = downloadUrl.toString();
      fb.child(id).set({
        "id": id,
        "link": url,
      }).then((value) {
        print("Done");
      });
    } catch (error) {
      print(error);
    }
  }
  @override
  void initState() {
    fb.once().then((DataSnapshot snap){
      print(snap);
      var data=snap.value;
      print(data);
      itemList.clear();
      data.forEach((key,value) {
        itemList.add(value['link']);
      });
      setState(() {
      });
    });
  }
}

class VideoWidget extends StatefulWidget {

  final bool play;
  final String url;

  const VideoWidget({Key key, @required this.url, @required this.play})
      : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}


class _VideoWidgetState extends State<VideoWidget> {
  VideoPlayerController videoPlayerController ;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    videoPlayerController = new VideoPlayerController.network(widget.url);
    _initializeVideoPlayerFuture = videoPlayerController.initialize().then((_) {
      setState(() {});
    });
  }
  @override
  void dispose() {
    videoPlayerController.dispose();
    //    widget.videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return new Container(
            child: Card(
              key: new PageStorageKey(widget.url),
              elevation: 5.0,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Chewie(
                      key: new PageStorageKey(widget.url),
                      controller: ChewieController(
                        videoPlayerController: videoPlayerController,
                        aspectRatio: 3 / 2,
                        autoInitialize: true,
                        looping: false,
                        autoPlay: false,
                        // Errors can occur for example when trying to play a video
                        // from a non-existent URL
                        errorBuilder: (context, errorMessage) {
                          return Center(
                            child: Text(
                              errorMessage,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        else {
          return Center(
            child: CircularProgressIndicator(),);
        }
      },
    );
  }
}