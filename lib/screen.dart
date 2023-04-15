import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = -1;

  List<String> butterflyName = [
    'Крапивница',
    'Павлиний глаз',
    'Капустница',
    'Голубянка алексис',
    'Голубянка аргус',
    'Переливница большая',
    'Траурница',
    'Червонец фиолетовый'
  ];

  List<AssetImage> butterflyImage = [
    const AssetImage('assets/images/1krapivnica.png'),
    const AssetImage('assets/images/2pavlinij_glaz.png'),
    const AssetImage('assets/images/3kapustnica.png'),
    const AssetImage('assets/images/4golubyanka_aleksis.png'),
    const AssetImage('assets/images/5golubyanka_argus.png'),
    const AssetImage('assets/images/6perelivnica_bolshaya.png'),
    const AssetImage('assets/images/7traurnitca.png'),
    const AssetImage('assets/images/8chervonec_fioletovyj.png')
  ];

  List<String> butterflyDescription = [
    'Крапивница (лат. Aglais urticae, =Nymphalis urticae) — дневная бабочка из семейства Нимфалиды (Nymphalidae), вид рода Aglais. Видовой эпитет названия — urticae, происходит от слова urtica (крапива) и объясняется тем, что крапива — одно из кормовых растений гусениц этого вида.',
    'Павлиний глаз (лат. Aglais io, ранее лат. Inachis io), дневной павлиний глаз — дневная бабочка из семейства нимфалид (Nymphalidae). Латинское биноминальное название происходит от Īnachis — царя Инаха и его дочери Ио в древнегреческой мифологии.',
    'Капустница или белянка капустная (лат. Pieris brassicae) — дневная бабочка из семейства белянок (Pieridae). Видовой эпитет происходит от лат. Brassica — капуста, одно из кормовых растений гусениц.',
    'Голубянка алексис (лат. Glaucopsyche alexis) — вид бабочек из семейства голубянки. Алексис — пастух и поэт в поэзии Вергилия и Горация.',
    'Голубянка аргус, или большой аргус (лат. Plebejus argus) — бабочка из семейства голубянок. Вид назван по имени героя греческих мифов Аргуса — сына Геи и стража Ио.',
    'Переливница ивовая, или радужница бо́льшая ивовая, или переливница большая, или ирида (лат. Apatura iris) — дневная бабочка из семейства Nymphalidae. Ирис (греческая мифология) — Ирида, дочь Тавманта и океаниды Электры, богиня радуги.',
    'Траурница (лат. Nymphalis antiopa) — вид дневных бабочек из семейства нимфалид (Nymphalidae). Русское название дано бабочке по её тёмной — «траурной» окраске. Латинский видовой эпитет antiopa связан с греческой мифологией: Антиопа — царица амазонок, взятая в плен Тесеем.',
    'Червонец фиолетовый, или червонец лиловатый (лат. Lycaena violacea) — дневная бабочка из семейства голубянок.'
  ];

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, constraints) => SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                "Butterfly guide",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              centerTitle: true,
            ),
            body: SizerUtil.orientation == Orientation.portrait
                ? portraitLayout()
                : landscapeLayout(),
          ),
        ),
      );

  Widget landscapeLayout() => Container(
        //color: Colors.amberAccent,
        //width: double.infinity,
        //height: double.infinity,
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: ListView.builder(
                  //scrollDirection: Axis.vertical,
                  itemCount: butterflyName.length,
                  itemBuilder: ((BuildContext context, int index) {
                    return InkWell(
                      onTap: () => setState(() {
                        _selectedIndex = index;
                      }),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(5),
                          color: _selectedIndex == index
                              ? const Color.fromARGB(255, 224, 246, 244)
                              : Colors.white,
                        ),
                        height: 50,
                        width: 150,
                        margin: const EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            'assets/images/icon_butterfly.png',
                            height: 20,
                          ),
                          title: Text(
                            butterflyName.elementAt(index),
                            style: const TextStyle(
                              fontSize: 16,
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  })),
            ),
            Expanded(
              flex: 1,
              child: Column(),
            ),
            Expanded(
              flex: 10,
              child: Container(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_selectedIndex != -1)
                      Center(
                        child: Image(
                          image: butterflyImage[_selectedIndex],
                          height: 130,
                          //width: 300,
                        ),
                      ),
                    const SizedBox(
                      height: 40,
                    ),
                    if (_selectedIndex != -1)
                      Text(
                        butterflyDescription[_selectedIndex],
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

//////////////////////////////

  Widget portraitLayout() => Container(
        //color: Colors.amberAccent,
        //width: double.infinity,
        //height: double.infinity,
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 60,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: butterflyName.length,
                  itemBuilder: ((BuildContext context, int index) {
                    return InkWell(
                      onTap: () => setState(() {
                        _selectedIndex = index;
                      }),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(5),
                          color: _selectedIndex == index
                              ? const Color.fromARGB(255, 224, 246, 244)
                              : Colors.white,
                        ),
                        height: 50,
                        width: 195,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            'assets/images/icon_butterfly.png',
                            height: 28,
                          ),
                          title: Text(
                            butterflyName.elementAt(index),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  })),
            ),
            const SizedBox(
              height: 70,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_selectedIndex != -1)
                    Center(
                      child: Image(
                        image: butterflyImage[_selectedIndex],
                        height: 200,
                      ),
                    ),
                  const SizedBox(
                    height: 40,
                  ),
                  if (_selectedIndex != -1)
                    Text(
                      butterflyDescription[_selectedIndex],
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      );
}
