// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:get/get.dart';
import './Theme/theme_constants.dart';
import 'Theme/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile',
      theme: MyTheme.darkTheme,
      home: MyHomePage(),
    );
  }
}

enum Skill { photoshop, xd, illustrator, afterEffect, lightRoom }

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final _heartbutton = false.obs;
  final _skill = Skill.photoshop.obs;

  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Demo'),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.chat_bubble_2),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(CupertinoIcons.ellipsis_vertical),
            onPressed: () {
              themeController.toggleTheme();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 92,
                child: Row(
                  children: [
                    const AvatarImage(),
                    const SizedBox(width: 16),
                    const Introduction(),
                    HeartIcon(heartbutton: _heartbutton)
                  ],
                ),
              ),
              const Description(),
              const Divider(
                color: Colors.white,
              ),
              const Skills(
                text: 'Skills',
              ),
              SkillTree(skill: _skill),
              const Divider(
                color: Colors.white,
              ),
              const Skills(text: 'Personal Information'),
              Column(
                children: [
                  Form(
                      child: Row(
                    children: const [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(CupertinoIcons.at),
                          ),
                        ),
                      )
                    ],
                  )),
                  const SizedBox(height: 5),
                  Form(
                      child: Row(
                    children: const [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(CupertinoIcons.padlock),
                          ),
                        ),
                      )
                    ],
                  )),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: (() {}), child: const Text('Save')),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SkillTree extends StatelessWidget {
  const SkillTree({
    Key? key,
    required Rx<Skill> skill,
  })  : _skill = skill,
        super(key: key);

  final Rx<Skill> _skill;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Obx(
        () => Wrap(
          spacing: 14,
          runSpacing: 8,
          children: [
            SkillContainer(
              skilltype: Skill.photoshop,
              ontap: () {
                _skill.value = Skill.photoshop;
              },
              imagepath: 'assets/images/app_icon_01.png',
              skillname: 'PhotoShop',
              shadowcolor: Colors.blue,
              isActive: _skill.value == Skill.photoshop ? true.obs : false.obs,
            ),
            SkillContainer(
              skilltype: Skill.lightRoom,
              ontap: () {
                _skill.value = Skill.lightRoom;
              },
              imagepath: 'assets/images/app_icon_02.png',
              skillname: 'LightRoom',
              shadowcolor: Colors.blueAccent,
              isActive: _skill.value == Skill.lightRoom ? true.obs : false.obs,
            ),
            SkillContainer(
              skilltype: Skill.afterEffect,
              ontap: () {
                _skill.value = Skill.afterEffect;
              },
              imagepath: 'assets/images/app_icon_03.png',
              skillname: 'AfterEffect',
              shadowcolor: Colors.blueAccent,
              isActive:
                  _skill.value == Skill.afterEffect ? true.obs : false.obs,
            ),
            SkillContainer(
              skilltype: Skill.illustrator,
              ontap: () {
                _skill.value = Skill.illustrator;
              },
              imagepath: 'assets/images/app_icon_04.png',
              skillname: 'Illustrator',
              shadowcolor: Colors.orange,
              isActive:
                  _skill.value == Skill.illustrator ? true.obs : false.obs,
            ),
            SkillContainer(
              skilltype: Skill.xd,
              ontap: () {
                _skill.value = Skill.xd;
              },
              imagepath: 'assets/images/app_icon_05.png',
              skillname: 'Xd',
              shadowcolor: Colors.purple,
              isActive: _skill.value == Skill.xd ? true.obs : false.obs,
            ),
          ],
        ),
      ),
    );
  }
}

class SkillContainer extends StatelessWidget {
  final Skill skilltype;
  final String skillname;
  final String imagepath;
  final Color shadowcolor;
  final RxBool isActive;
  final Function() ontap;
  const SkillContainer({
    Key? key,
    required this.skillname,
    required this.imagepath,
    required this.shadowcolor,
    required this.isActive,
    required this.skilltype,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: ontap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 100,
          height: 100,
          decoration: isActive.value
              ? BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.circular(8))
              : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: isActive.value
                    ? BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: shadowcolor,
                          blurRadius: 10,
                        )
                      ])
                    : null,
                child: Image.asset(
                  imagepath,
                  width: 50,
                  height: 50,
                ),
              ),
              Text(
                skillname,
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(lorem(words: 30, paragraphs: 1)),
    );
  }
}

class Skills extends StatelessWidget {
  final String text;
  const Skills({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(
            width: 3,
          ),
          Icon(
            CupertinoIcons.chevron_down,
            size: Theme.of(context).textTheme.caption!.fontSize,
          )
        ],
      ),
    );
  }
}

class HeartIcon extends StatelessWidget {
  const HeartIcon({
    Key? key,
    required RxBool heartbutton,
  })  : _heartbutton = heartbutton,
        super(key: key);

  final RxBool _heartbutton;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IconButton(
        icon: _heartbutton.value
            ? const Icon(CupertinoIcons.heart_fill)
            : const Icon(CupertinoIcons.heart),
        color: Theme.of(context).primaryColor,
        onPressed: () {
          _heartbutton.toggle();
        },
      ),
    );
  }
}

class Introduction extends StatelessWidget {
  const Introduction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Parsa Kermanian',
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: 5),
          Text('Android Developer',
              style: Theme.of(context).textTheme.bodyText1),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.location,
                size: Theme.of(context).textTheme.bodyText2!.fontSize,
              ),
              const SizedBox(width: 5),
              const Text('Torrento, Canada')
            ],
          )
        ],
      ),
    );
  }
}

class AvatarImage extends StatelessWidget {
  const AvatarImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        'assets/images/1234.jpg',
        width: 90,
        height: 90,
      ),
    );
  }
}
