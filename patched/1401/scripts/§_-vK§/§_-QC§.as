package §_-vK§
{
   import flash.utils.Dictionary;
   import utils.§_-xb§;
   
   public class §_-QC§
   {
      
      public static const §_-l11§:String = "default";
      
      public static const §_-42e§:String = "level";
      
      public static const §_-W2r§:String = "total";
      
      public static const §_-O2B§:String = "buff";
      
      public static const §_-9V§:int = 147;
      
      public static const §_-A2J§:int = 148;
      
      public static const §_-51S§:int = 149;
      
      public static const §_-419§:int = 150;
      
      public static const §_-o1X§:int = 151;
      
      public static const §_-t§:int = 152;
      
      public static const §_-5A§:int = 153;
      
      public static const §_-uK§:int = 154;
      
      public static const §_-i14§:int = 155;
      
      public static const §_-52x§:int = 156;
      
      public static const §_-E1d§:int = 157;
      
      public static const §_-N4§:int = 158;
      
      public static const §_-i2L§:int = 159;
      
      public static const §_-C7§:int = 160;
      
      public static const §_-uy§:int = 161;
      
      public static const §_-d1§:int = 162;
      
      public static const §_-11H§:int = 163;
      
      public static const §_-22p§:int = 164;
      
      public static const §_-j1l§:int = 165;
      
      public static const §_-22s§:int = 166;
      
      public static const §_-i1I§:int = 167;
      
      public static const §_-8R§:int = 168;
      
      public static const §_-d2J§:int = 169;
      
      public static const §_-33a§:int = 170;
      
      public static const §_-v1l§:int = 171;
      
      public static const §_-82p§:int = 172;
      
      public static const §_-mg§:int = 173;
      
      public static const §_-F1S§:int = 174;
      
      public static const §_-oS§:int = 175;
      
      public static const §_-01S§:int = 176;
      
      public static const §_-M1H§:int = 177;
      
      public static const §_-u1I§:int = 178;
      
      public static const §_-B1u§:int = 179;
      
      public static const §_-a1c§:int = 180;
      
      public static const §_-N2s§:int = 181;
      
      public static const §_-CX§:int = 182;
      
      public static const §_-Kh§:int = 183;
      
      public static const §_-82B§:int = 184;
      
      public static const §_-Xs§:int = 185;
      
      public static const §_-a1o§:int = 186;
      
      public static const §_-N1r§:int = 187;
      
      public static const §_-l1z§:int = 188;
      
      public static const §_-Au§:int = 189;
      
      public static const §_-a2F§:int = 190;
      
      public static const §_-k1B§:int = 191;
      
      public static const §_-93§:int = 192;
      
      public static const §_-y1Q§:int = 193;
      
      public static const §_-53z§:int = 194;
      
      public static const §_-Q1U§:int = 195;
      
      public static const §_-g23§:int = 196;
      
      public static const §_-A2A§:int = 197;
      
      public static const §_-r1s§:int = 198;
      
      public static const §_-6n§:int = 199;
      
      public static var perkData:Dictionary = new Dictionary(false);
      
      public static var i:* = §_-QC§.init();
      
      public function §_-QC§()
      {
         super();
      }
      
      public static function init() : void
      {
         perkData[§_-9V§] = {
            "perkClass":§_-DS§,
            "name":gls("Большой орех"),
            "active":false,
            "description":{
               "default":gls("Увеличивает размер ореха на локации."),
               "level":{
                  "free":[gls("Увеличивает размер ореха на {0}%.","<bonus_level_free_1>"),gls("Увеличивает размер ореха на {0}%.","<bonus_level_free_2>"),gls("Увеличивает размер ореха на {0}%.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает размер ореха на {0}%.","<bonus_level_paid_1>"),gls("Увеличивает размер ореха на {0}%.","<bonus_level_paid_2>"),gls("Размер ореха сохраняется после смерти шамана.")]
               },
               "total":{
                  "free":[gls("Увеличивает размер ореха на {0}%.","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>","<descr_total_level_free_1> <descr_level_level_paid_3>"]
               }
            },
            "buttonClass":PerkShamanButton1,
            "bonuses":{
               "free":[5,6,7],
               "paid":[9,13,0]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-A2J§] = {
            "perkClass":§_-r1b§,
            "name":gls("Массовое безумие"),
            "active":true,
            "description":{
               "default":gls("При активации накладывает на всех белок эффект магии «белка-варвар». Позволяет ходить по головам других белок."),
               "level":{
                  "free":[gls("{0} Время действия навыка — {1} сек.","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает время действия навыка на {0} сек.","<bonus_level_free_2>"),gls("Увеличивает время действия навыка на {0} сек.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает время действия навыка на {0} сек.","<bonus_level_paid_1>"),gls("Увеличивает время действия навыка на {0} сек.","<bonus_level_paid_2>"),gls("Позволяет белкам отталкивать от себя других белок. Увеличивает время действия навыка на {0} сек.","<bonus_level_paid_3>")]
               },
               "total":{
                  "free":[gls("{0} Время действия навыка — {1} сек.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>",gls("{0} Позволяет белкам отталкивать от себя других белок.","<descr_total_level_free_1>")]
               },
               "buff":{
                  "free":["<descr_default>","<descr_default>","<descr_default>"],
                  "paid":["<descr_default>","<descr_default>",gls("{0} Позволяет белкам отталкивать от себя других белок.","<descr_default>")]
               }
            },
            "buttonClass":PerkShamanButton2,
            "bonuses":{
               "free":[1,2,3],
               "paid":[3,5,2]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-51S§] = {
            "perkClass":§_-12N§,
            "name":gls("Обожание шамана"),
            "active":true,
            "description":{
               "default":gls("При активации навыка, белки вблизи шамана повторяют его эмоции, когда он плачет или смеётся. Требуется время на восстановление навыка."),
               "total":{
                  "free":[gls("При активации навыка, белки вблизи шамана повторяют его эмоции, когда он плачет или смеётся. Время восстановления навыка — 30 сек. Количество белок, повторяющих за шаманом — {0}.","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>",gls("При активации навыка, все белки на карте повторяют эмоции шамана. Навык восстанавливается мгновенно.")]
               },
               "level":{
                  "free":[gls("При активации навыка, белки вблизи шамана повторяют его эмоции, когда он плачет или смеётся. Требуется время на восстановление навыка. Время восстановления навыка — 30 сек. Количество белок, повторяющих за шаманом — {0}.","<bonus_level_free_1>"),gls("Увеличивает количество белок повторяющих за шаманом на {0}.","<bonus_level_free_2>"),gls("Увеличивает количество белок повторяющих за шаманом на {0}.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает количество белок повторяющих за шаманом на {0}.","<bonus_level_paid_1>"),gls("Увеличивает количество белок повторяющих за шаманом на {0}.","<bonus_level_paid_2>"),gls("Все белки на карте повторяют эмоции шамана. Время восстановления навыка — 0 сек.")]
               }
            },
            "buttonClass":PerkShamanButton3,
            "bonuses":{
               "free":[1,2,3],
               "paid":[3,5,0]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-419§] = {
            "perkClass":§_-42L§,
            "name":gls("Дух моржа"),
            "active":false,
            "description":{
               "default":gls("Увеличивает скорость белок в воде вблизи шамана на {0}%.",§_-42L§.§_-SD§),
               "level":{
                  "free":[gls("{0} Навык действует в небольшом радиусе от шамана. Радиус увеличен на {1}%","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает радиус действия навыка на {0}%.","<bonus_level_free_2>"),gls("Увеличивает радиус действия навыка на {0}%.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает радиус действия навыка на {0}%.","<bonus_level_paid_1>"),gls("Увеличивает радиус навыка действия на {0}%.","<bonus_level_paid_2>"),gls("Навык действует на всех белок на локации.")]
               },
               "total":{
                  "free":[gls("{0} Навык действует в небольшом радиусе от шамана. Радиус увеличен на {1}%.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>","<descr_default> <descr_level_level_paid_3>"]
               },
               "buff":{
                  "free":["<descr_default>","<descr_default>","<descr_default>"],
                  "paid":["<descr_default>","<descr_default>","<descr_default>"]
               }
            },
            "buttonClass":PerkShamanButton4,
            "bonuses":{
               "free":[5,10,15],
               "paid":[15,20,0]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-o1X§] = {
            "perkClass":§_-u6§,
            "name":gls("Тонкий лёд"),
            "active":true,
            "description":{
               "default":gls("При активации позволяет выбранной белке провалиться сквозь препятствия. Требуется время на восстановление навыка."),
               "level":{
                  "free":[gls("При активации позволяет выбранной белке провалиться сквозь препятствия. Время восстановления навыка — 1 минута. Количество применений навыка за раунд — {0}.","<bonus_level_free_1>"),gls("Увеличивает количество применений навыка на {0}.","<bonus_level_free_2>"),gls("Увеличивает количество применений навыка на {0}.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает количество применений навыка на {0}.","<bonus_level_paid_1>"),gls("Увеличивает количество применений навыка на {0}.","<bonus_level_paid_2>"),gls("Уменьшает время восстановления навыка на 30 сек.")]
               },
               "total":{
                  "free":[gls("При активации позволяет выбранной белке провалиться сквозь препятствия. Время восстановления навыка — 1 минута. Количество применений навыка за раунд — {0}.","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>",gls("При активации позволяет выбранной белке провалиться сквозь препятствия. Время восстановления навыка — 30 сек. Количество применений навыка за раунд — {0}.","<bonus_total>")]
               }
            },
            "buttonClass":PerkShamanButton5,
            "bonuses":{
               "free":[1,1,1],
               "paid":[1,1,0]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-t§] = {
            "perkClass":§_-G1s§,
            "name":gls("Ледяной куб"),
            "active":true,
            "description":{
               "default":gls("При активации выбранная белка заключается в ледяной куб на 2 секунды."),
               "level":{
                  "free":[gls("{0} Количество применений навыка за раунд — {1}.","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает количество применений навыка на {0}.","<bonus_level_free_2>"),gls("Увеличивает количество применений навыка на {0} и размер ледяного куба на {1}%.","<bonus_level_free_3>","<extraBonus_level_free_3>")],
                  "paid":[gls("Увеличивает количество применений навыка на {0} и размер ледяного куба на {1}%.","<bonus_level_paid_1>","<extraBonus_level_paid_1>"),gls("Увеличивает количество применений навыка на {0} и размер ледяного куба на {1}%.","<bonus_level_paid_2>","<extraBonus_level_paid_2>"),gls("Увеличивает количество применений навыка на {0} и размер ледяного куба на {1}%. Позволяет белкам вставать на ледяной куб.","<bonus_level_paid_3>","<extraBonus_level_paid_3>")]
               },
               "total":{
                  "free":[gls("{0} Количество применений навыка за раунд — {1}.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>",gls("{0} Размер ледяного куба увеличен на {1}%.","<descr_total_level_free_1>","<extraBonus_total>")],
                  "paid":["<descr_total_level_free_3>","<descr_total_level_free_3>",gls("{0} Белки могут вставать на куб.","<descr_total_level_free_3>")]
               }
            },
            "buttonClass":PerkShamanButton6,
            "bonuses":{
               "free":[1,1,1],
               "paid":[1,1,2]
            },
            "extraBonuses":{
               "free":[0,0,5],
               "paid":[7,8,10]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-5A§] = {
            "perkClass":§_-Go§,
            "name":gls("Руна"),
            "active":true,
            "description":{
               "default":gls("При активации создаёт руну. Руна движется в заданном направлении и перемещает объекты. Время жизни руны — 30 сек."),
               "level":{
                  "free":[gls("{0} Увеличивает силу воздействия на объекты на {1}%.","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает силу воздействия на объекты на {0}%.","<bonus_level_free_2>"),gls("Увеличивает силу воздействия на объекты на {0}%.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает силу воздействия на объекты на {0}%.","<bonus_level_paid_1>"),gls("Увеличивает силу воздействия на объекты на {0}%.","<bonus_level_paid_2>"),gls("Увеличивает силу воздействия на объекты на {0}% и скорость перемещения руны на {1}%.","<bonus_level_paid_3>",§_-Go§.§_-s2W§)]
               },
               "total":{
                  "free":[gls("{0} Сила воздействия на объекты увеличена на {1}%.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>",gls("{0} Скорость перемещения руны увеличена на {1}%.","<descr_total_level_free_1>",§_-Go§.§_-s2W§)]
               }
            },
            "buttonClass":PerkShamanButton7,
            "bonuses":{
               "free":[5,7,9],
               "paid":[15,35,29]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-uK§] = {
            "perkClass":§_-P1H§,
            "name":gls("Цепкие коготки"),
            "active":false,
            "description":{
               "default":gls("Увеличивает силу трения для белок на льду и на земле."),
               "level":{
                  "free":[gls("{0} Сила трения для белок увеличена на {1}%.","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает силу трения для белок на {0}%.","<bonus_level_free_2>"),gls("Увеличивает силу трения для белок на {0}%.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает силу трения для белок на {0}%.","<bonus_level_paid_1>"),gls("Увеличивает силу трения для белок на {0}%.","<bonus_level_paid_2>"),gls("Белки не скользят по земле и по льду.")]
               },
               "total":{
                  "free":[gls("{0} Сила трения для белок увеличена на {1}%","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>","<descr_level_level_paid_3>"]
               },
               "buff":{
                  "free":["<descr_total_level_free_1>","<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>","<descr_level_level_paid_3>"]
               }
            },
            "buttonClass":PerkShamanButton8,
            "bonuses":{
               "free":[2,3,5],
               "paid":[10,15,1000]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-i14§] = {
            "perkClass":§_-J24§,
            "name":gls("Аура шустрости"),
            "active":false,
            "description":{
               "default":gls("Увеличивает скорость перемещения белок рядом с шаманом"),
               "level":{
                  "free":[gls("Вблизи шамана белки перемещаются быстрее на {0}%. Навык действует в небольшом радиусе от шамана. Радиус увеличен на {1}%.",§_-J24§.§_-s2W§,"<bonus_level_free_1>"),gls("Увеличивает радиус действия навыка на {0}%.","<bonus_level_free_2>"),gls("Увеличивает радиус действия навыка на {0}%.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает радиус действия навыка на {0}%.","<bonus_level_paid_1>"),gls("Увеличивает радиус действия навыка на {0}%.","<bonus_level_paid_2>"),gls("Увеличивает радиус действия навыка на {0}% и скорость перемещения белок на {1}%.","<bonus_level_paid_3>",§_-J24§.§_-A1A§)]
               },
               "total":{
                  "free":[gls("Вблизи шамана белки перемещаются быстрее на {0}%. Навык действует в небольшом радиусе от шамана. Радиус увеличен на {1}%.",§_-J24§.§_-s2W§,"<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>",gls("Вблизи шамана белки перемещаются на {0}% быстрее. Навык действует в небольшом радиусе от шамана. Радиус увеличен на {1}%.",§_-J24§.§_-s2W§ + §_-J24§.§_-A1A§,"<bonus_total>")]
               },
               "buff":{
                  "free":["<descr_default>","<descr_default>","<descr_default>"],
                  "paid":["<descr_default>","<descr_default>",gls("Вблизи шамана белки перемещаются на {0}% быстрее.",§_-J24§.§_-s2W§ + §_-J24§.§_-A1A§)]
               }
            },
            "buttonClass":PerkShamanButton9,
            "bonuses":{
               "free":[5,10,15],
               "paid":[15,20,10]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-52x§] = {
            "perkClass":§_-61§,
            "name":gls("Указатель"),
            "active":true,
            "description":{
               "default":gls("При активации устанавливает указатель места сбора для белок. Время жизни указателя — 5 секунд."),
               "level":{
                  "free":[gls("{0} Размер указателя увеличен на {1}%.","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает размер указателя на {0}%.","<bonus_level_free_2>"),gls("Увеличивает размер указателя на {0}%.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает размер указателя на {0}%.","<bonus_level_paid_1>"),gls("Увеличивает размер указателя на {0}%.","<bonus_level_paid_2>"),gls("Увеличивает размер указателя на {0}%. Указатель анимирован.","<bonus_level_paid_3>")]
               },
               "total":{
                  "free":[gls("{0} Размер указателя увеличен на {1}%.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>",gls("{0} Указатель анимирован.","<descr_total_level_free_1>")]
               }
            },
            "buttonClass":PerkShamanButton10,
            "bonuses":{
               "free":[2,3,5],
               "paid":[10,15,20]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-E1d§] = {
            "perkClass":§_-BX§,
            "name":gls("Отстающий"),
            "active":false,
            "description":{
               "default":gls("Увеличивает скорость и высоту прыжка для последней белки. Навык действует, если в дупло зашла хотя бы одна белка."),
               "level":{
                  "free":[gls("{0} Увеличивает скорость перемещения и высоту прыжка на {1}%.","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает скорость перемещения и высоту прыжка на {0}%.","<bonus_level_free_2>"),gls("Увеличивает скорость перемещения и высоту прыжка белки на {0}%.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает скорость перемещения и высоту прыжка белки на {0}%.","<bonus_level_paid_1>"),gls("Увеличивает скорость перемещения и высоту прыжка белки на {0}%.","<bonus_level_paid_2>"),gls("Увеличивает скорость перемещения и высоту прыжка белки на {0}%.","<bonus_level_paid_3>")]
               },
               "total":{
                  "free":[gls("{0} Увеличивает скорость перемещения и высоту прыжка на {1}%.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>","<descr_total_level_free_1>"]
               },
               "buff":{
                  "free":[gls("Последняя белка, незабежавшая в дупло, бегает быстрее и прыгает выше. Увеличивает скорость перемещения и высоту прыжка на {0}%.","<bonus_total>"),"<descr_buff_level_free_1>","<descr_buff_level_free_1>"],
                  "paid":["<descr_buff_level_free_1>","<descr_buff_level_free_1>","<descr_buff_level_free_1>"]
               }
            },
            "buttonClass":PerkShamanButton11,
            "bonuses":{
               "free":[2,3,5],
               "paid":[5,5,10]
            },
            "gold_cost":[50,50,5]
         };
         perkData[§_-N4§] = {
            "perkClass":§_-Z2§,
            "name":gls("Воодушевление"),
            "active":false,
            "description":{
               "default":gls("Увеличивает высоту прыжка для белок рядом с шаманом на {0}%.",§_-Z2§.§_-cS§),
               "level":{
                  "free":[gls("{0} Навык действует в небольшом радиусе от шамана. Радиус увеличен на {1}%.","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает радиус действия навыка на {0}%.","<bonus_level_free_2>"),gls("Увеличивает радиус действия навыка на {0}%.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает радиус действия навыка на {0}%.","<bonus_level_paid_1>"),gls("Увеличивает радиус действия навыка на {0}%.","<bonus_level_paid_2>"),gls("Увеличивает радиус действия навыка на {0}% и высоту прыжка белок на {1}%.","<bonus_level_paid_3>",§_-Z2§.§_-H2y§)]
               },
               "total":{
                  "free":[gls("{0} Навык действует в небольшом радиусе от шамана. Радиус увеличен на {1}%.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>","Вблизи шамана белки прыгают выше на " + (§_-Z2§.§_-cS§ + §_-Z2§.§_-H2y§) + "%. Навык действует в небольшом радиусе от шамана. Радиус увеличен на <bonus_total>%."]
               },
               "buff":{
                  "free":["<descr_default>","<descr_default>","<descr_default>"],
                  "paid":["<descr_default>","<descr_default>",gls("Вблизи шамана белки прыгают выше на {0}%.",§_-Z2§.§_-cS§ + §_-Z2§.§_-H2y§)]
               }
            },
            "buttonClass":PerkShamanButton12,
            "bonuses":{
               "free":[5,10,15],
               "paid":[15,20,10]
            },
            "gold_cost":[50,50,5]
         };
         perkData[§_-i2L§] = {
            "perkClass":§_-s2e§,
            "name":gls("Друг шамана"),
            "active":true,
            "description":{
               "default":gls("При активации выбранная белка становится другом шамана. Друг шамана получает бонус к скорости передвижения и высоте прыжка. Время действия навыка — 10 сек. Время восстановления навыка — 5 сек."),
               "level":{
                  "free":[gls("{0} Скорость перемещения и высота прыжка друга шамана увеличены на {1}%.","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает скорость перемещения и высоту прыжка друга шамана на {0}%.","<bonus_level_free_2>"),gls("Увеличивает скорость перемещения и высоту прыжка друга шамана на {0}%.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает скорость перемещения и высоту прыжка друга шамана на {0}%.","<bonus_level_paid_1>"),gls("Увеличивает скорость перемещения и высоту прыжка друга шамана на {0}%.","<bonus_level_paid_2>"),gls("Шаман может выбрать двух друзей.")]
               },
               "total":{
                  "free":[gls("{0} Скорость перемещения и высота прыжка друга шамана увеличены на {1}%.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>",gls("Назначает двух белок друзьями шамана. Теперь белки бегают быстрее и прыгают выше. Время действия навыка — 10 сек. Время восстановления навыка — 5 сек. Скорость перемещения и высота прыжка друга шамана увеличены на {0}%.","<bonus_total>")]
               },
               "buff":{
                  "free":[gls("Скорость перемещения и высота прыжка друга шамана увеличены на {0}%.","<bonus_total>"),"<descr_buff_level_free_1>","<descr_buff_level_free_1>"],
                  "paid":["<descr_buff_level_free_1>","<descr_buff_level_free_1>","<descr_buff_level_free_1>"]
               }
            },
            "buttonClass":PerkShamanButton13,
            "bonuses":{
               "free":[2,3,5],
               "paid":[10,15,0]
            },
            "gold_cost":[50,50,5]
         };
         perkData[§_-C7§] = {
            "perkClass":§_-wR§,
            "name":gls("Телепорт"),
            "active":true,
            "description":{
               "default":gls("При активации мгновенно перемещает белку к шаману. Навык имеет ограниченный радиус применения."),
               "level":{
                  "free":[gls("{0} Радиус увеличен на {1}%.","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает радиус применения навыка на {0}%.","<bonus_level_free_2>"),gls("Увеличивает радиус применения навыка на {0}% и количество белок для перемещения на {1}.","<bonus_level_free_3>","<extraBonus_level_free_3>")],
                  "paid":[gls("Увеличивает радиус применения навыка на {0}% и количество белок для перемещения на {1}.","<bonus_level_paid_1>","<extraBonus_level_paid_1>"),gls("Увеличивает радиус применения навыка на {0}% и количество белок для перемещения на {1}.","<bonus_level_paid_2>","<extraBonus_level_paid_2>"),gls("Увеличивает радиус применения навыка на {0}% и количество белок для перемещения на {1}.","<bonus_level_paid_3>","<extraBonus_level_paid_3>")]
               },
               "total":{
                  "free":[gls("{0} Радиус увеличен на {1}%.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>",gls("{0} Количество белок, которых может телепортировать шаман — {1}.","<descr_total_level_free_1>","<extraBonus_total>")],
                  "paid":["<descr_total_level_free_3>","<descr_total_level_free_3>","<descr_total_level_free_3>"]
               }
            },
            "buttonClass":PerkShamanButton14,
            "bonuses":{
               "free":[5,5,5],
               "paid":[7,8,100]
            },
            "extraBonuses":{
               "free":[1,0,1],
               "paid":[1,1,1]
            },
            "gold_cost":[70,70,5]
         };
         perkData[§_-uy§] = {
            "perkClass":§_-Fl§,
            "name":gls("Беличье счастье"),
            "active":true,
            "description":{
               "default":gls("При активации мгновенно перемещает выбранную белку с орехом в дупло. Навык нельзя применить сразу после того, как игрок стал шаманом."),
               "level":{
                  "free":[gls("<descr_default> Время восстановления навыка — {0}{1} сек.",§_-Fl§.§_-P2q§,"<sub><bonus_level_free_1>"),gls("Время восстановления навыка меньше на {0} сек.","<bonus_level_free_2>"),gls("Время восстановления навыка меньше на {0} сек.","<bonus_level_free_3>")],
                  "paid":[gls("Время восстановления навыка меньше на {0} сек.","<bonus_level_paid_1>"),gls("Увеличивает количество белок, которых можно телепортировать, на {0}.","<extraBonus_level_paid_2>"),gls("Восстановление навыка меньше на {0} сек. Увеличивает количество белок для перемещения, на {1}.","<bonus_level_paid_3>","<extraBonus_level_paid_3>")]
               },
               "total":{
                  "free":[gls("<descr_default> Время восстановления навыка — {0}{1} сек.",§_-Fl§.§_-P2q§,"<sub><bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>",gls("{0} Количество белок, которых можно телепортировать — {1}.","<descr_total_level_free_1>","<extraBonus_total>"),"<descr_total_level_paid_2>"]
               }
            },
            "buttonClass":PerkShamanButton15,
            "bonuses":{
               "free":[0,10,10],
               "paid":[10,0,20]
            },
            "extraBonuses":{
               "free":[1,0,0],
               "paid":[0,1,1]
            },
            "gold_cost":[70,70,5]
         };
         perkData[§_-d1§] = {
            "perkClass":§_-g2j§,
            "name":gls("Любимчик"),
            "active":true,
            "description":{
               "default":gls("При активации передаёт орех выбранной белке. Требуется время на восстановление навыка."),
               "level":{
                  "free":[gls("Передаёт орех выбранной белке. Время восстановления навыка — 1 минута. Количество белок, которым можно передать орех — {0}.","<bonus_level_free_1>"),gls("Увеличивает количество белок, которым можно передать орех, на {0}.","<bonus_level_free_2>"),gls("Уменьшает время восстановления навыка на {0} сек.","<extraBonus_level_free_3>")],
                  "paid":[gls("Увеличивает количество белок, которым можно передать орех, на {0}.","<bonus_level_paid_1>"),gls("Увеличивает количество белок, которым можно передать орех, на {0}.","<bonus_level_paid_2>"),gls("Уменьшает время восстановления навыка на {0} сек.","<extraBonus_level_paid_3>")]
               },
               "total":{
                  "free":[gls("Передаёт орех выбранной белке. Время восстановления навыка — {0}{1} сек. Количество белок, которым можно передать орех — {2}.",§_-g2j§.§_-P2q§,"<sub><extraBonus_total>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>","<descr_total_level_free_1>"]
               }
            },
            "buttonClass":PerkShamanButton16,
            "bonuses":{
               "free":[2,1,0],
               "paid":[1,1,0]
            },
            "extraBonuses":{
               "free":[0,0,20],
               "paid":[0,0,30]
            },
            "gold_cost":[70,70,5]
         };
         perkData[§_-11H§] = {
            "perkClass":§_-D1V§,
            "name":gls("Массовое бессмертие"),
            "active":true,
            "description":{
               "default":gls("При активации белки становятся бессмертными. Можно воспользоваться 1 раз за раунд. Не действует на шамана."),
               "level":{
                  "free":[gls("{0} Время действия навыка — {1} сек.","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает время действия навыка на {0} сек.","<bonus_level_free_2>"),gls("Увеличивает время действия навыка на {0} сек.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает время действия навыка на {0} сек.","<bonus_level_paid_1>"),gls("Увеличивает время действия навыка на {0} сек.","<bonus_level_paid_2>"),gls("В течение 2 секунд, после окончания действия навыка, белки воскрешаются вблизи шамана.")]
               },
               "total":{
                  "free":[gls("{0} Время действия навыка — {1} сек.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>","<descr_total_level_free_1> <descr_level_level_paid_3>"]
               },
               "buff":{
                  "free":["<descr_default>","<descr_default>","<descr_default>"],
                  "paid":["<descr_default>","<descr_default>","<descr_default> <descr_level_level_paid_3>"]
               }
            },
            "buttonClass":PerkShamanButton17,
            "bonuses":{
               "free":[1,2,2],
               "paid":[3,5,0]
            },
            "gold_cost":[70,70,5]
         };
         perkData[§_-22p§] = {
            "perkClass":§_-on§,
            "name":gls("Большая голова"),
            "active":false,
            "description":{
               "default":gls("Увеличивает голову шамана."),
               "level":{
                  "free":[gls("{0} Размер головы увеличен на {1}%.","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает размер головы на {0}%.","<bonus_level_free_2>"),gls("Увеличивает размер головы на {0}%.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает размер головы на {0}%.","<bonus_level_paid_1>"),gls("Увеличивает размер головы на {0}%.","<bonus_level_paid_2>"),gls("Увеличивает всего шамана.")]
               },
               "total":{
                  "free":[gls("{0} Размер головы увеличен на {1}%.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>",gls("Увеличивает всего шамана.")]
               }
            },
            "buttonClass":PerkShamanButton18,
            "bonuses":{
               "free":[5,6,7],
               "paid":[9,13,0]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-j1l§] = {
            "perkClass":§_-H1O§,
            "name":gls("Тучка"),
            "active":false,
            "description":{
               "default":gls("Создаёт тучку на месте гибели белки. Время жизни тучки ограничено."),
               "level":{
                  "free":[gls("На месте гибели белки появляется тучка. Количество тучек, которые могут появится за раунд — {0}. Тучка активна — {1} сек.","<bonus_level_free_1>","<extraBonus_level_free_1>"),gls("Увеличивает количество тучек в каждом раунде на {0}. Увеличивает время жизни тучек на {1} сек.","<bonus_level_free_2>","<extraBonus_level_free_2>"),gls("Увеличивает количество тучек в каждом раунде на {0}. Увеличивает время жизни тучек на {1} сек.","<bonus_level_free_3>","<extraBonus_level_free_3>")],
                  "paid":[gls("Увеличивает количество тучек в каждом раунде на {0}. Увеличивает время жизни тучек на {1} сек. Тучкой можно воспользоваться для подъёма вверх.","<bonus_level_paid_1>","<extraBonus_level_paid_1>"),gls("Увеличивает количество тучек в каждом раунде на {0}. Увеличивает время жизни тучек на {1} сек. Тучка поднимается медленнее на 50%.","<bonus_level_paid_1>","<extraBonus_level_paid_1>"),gls("Увеличивает время жизни тучек на {0} сек.","<extraBonus_level_paid_3>")]
               },
               "total":{
                  "free":[gls("На месте гибели белки появляется тучка. Количество тучек, которые могут появится за раунд — {0}. Тучка активна — {1} сек.","<bonus_total>","<extraBonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":[gls("{0} Тучкой можно воспользоваться для подъёма вверх.","<descr_total_level_free_1>"),gls("{0} Тучка поднимается медленнее на 50%.","<descr_total_level_paid_1>"),"<descr_total_level_paid_2>"]
               }
            },
            "buttonClass":PerkShamanButton19,
            "bonuses":{
               "free":[1,2,3],
               "paid":[3,3,0]
            },
            "extraBonuses":{
               "free":[2,2,3],
               "paid":[3,3,10]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-22s§] = {
            "perkClass":§_-ln§,
            "name":gls("Тяжёлый шаман"),
            "active":true,
            "description":{
               "default":gls("При активации увеличивает вес шамана."),
               "level":{
                  "free":[gls("Вес шамана увеличивается на {0}%.","<bonus_level_free_1>"),gls("Увеличивает вес шамана на {0}%.","<bonus_level_free_2>"),gls("Увеличивает вес шамана на {0}%.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает вес шамана на {0}%.","<bonus_level_paid_1>"),gls("Увеличивает вес шамана на {0}%.","<bonus_level_paid_2>"),gls("Увеличивает вес шамана на {0}%.","<bonus_level_paid_3>")]
               },
               "total":{
                  "free":[gls("Вес шамана увеличивается на {0}%.","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>","<descr_total_level_free_1>"]
               }
            },
            "buttonClass":PerkShamanButton20,
            "bonuses":{
               "free":[20,30,40],
               "paid":[50,60,90]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-i1I§] = {
            "perkClass":§_-k12§,
            "name":gls("Капитуляция"),
            "active":true,
            "description":{
               "default":gls("При активации другой игрок становится шаманом. Вы получаете дополнительные орешки и перемещаетесь к шаману. Навык можно применять один раз за раунд."),
               "level":{
                  "free":[gls("{0} Количество орешков — {1}.","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает количество орешков на {0}.","<bonus_level_free_2>"),gls("Увеличивает количество орешков на {0}.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает количество орешков на {0}.","<bonus_level_paid_1>"),gls("Увеличивает количество орешков на {0}.","<bonus_level_paid_2>"),gls("Если вы не подобрали орех, а до конца раунда меньше 30 секунд, то будете перемещены к ореху.")]
               },
               "total":{
                  "free":[gls("{0} Количество орешков — {1}.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>",gls("Другой игрок становится шаманом. Вы получаете дополнительные орешки. Если до конца раунда меньше 30 сек. и нет ореха — перемещаетесь к ореху, если орех уже у вас — к новому шаману. Количество орешков — {0}. Навык можно применять один раз за раунд.","<bonus_total>")]
               }
            },
            "buttonClass":PerkShamanButton21,
            "bonuses":{
               "free":[2,2,3],
               "paid":[6,7,0]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-8R§] = {
            "perkClass":§_-rf§,
            "name":gls("Летун"),
            "active":false,
            "description":{
               "default":gls("Уменьшает скорость падения."),
               "level":{
                  "free":[gls("{0} Скорость падения уменьшается на {1}%.","<descr_default>","<bonus_level_free_1>"),gls("Уменьшает скорость падения на {0}%.","<bonus_level_free_2>"),gls("Уменьшает скорость падения на {0}%.","<bonus_level_free_3>")],
                  "paid":[gls("Уменьшает скорость падения на {0}%.","<bonus_level_paid_1>"),gls("Уменьшает скорость падения на {0}%.","<bonus_level_paid_2>"),gls("Позволяет подпрыгнуть в падении.")]
               },
               "total":{
                  "free":[gls("{0} Скорость падения уменьшается на {1}%.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>","<descr_total_level_free_1> <descr_level_level_paid_3>"]
               }
            },
            "buttonClass":PerkShamanButton22,
            "bonuses":{
               "free":[2,3,5],
               "paid":[10,15,0]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-d2J§] = {
            "perkClass":§_-z2C§,
            "name":gls("Улучшенный телекинез"),
            "active":false,
            "description":{
               "default":gls("Увеличивает радиус применения телекинеза."),
               "level":{
                  "free":[gls("{0} Радиус увеличен на {1}%.","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает радиус телекинеза на {0}%.","<bonus_level_free_2>"),gls("Увеличивает радиус телекинеза на {0}%.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает радиус телекинеза на {0}%.","<bonus_level_paid_1>"),gls("Увеличивает радиус телекинеза на {0}%.","<bonus_level_paid_2>"),gls("Увеличивает радиус телекинеза на {0}%. Меняет цвет луча на красный.","<bonus_level_paid_3>")]
               },
               "total":{
                  "free":[gls("{0} Радиус увеличен на {1}%.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>",gls("{0} Красный луч телекинеза.","<descr_total_level_free_1>")]
               }
            },
            "buttonClass":PerkShamanButton23,
            "bonuses":{
               "free":[1,2,2],
               "paid":[3,5,7]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-33a§] = {
            "perkClass":§_-1D§,
            "name":gls("Фронтальный телепорт"),
            "active":true,
            "description":{
               "default":gls("При активации телепортирует шамана вперёд."),
               "level":{
                  "free":["<descr_default>",gls("Увеличивает количество применений навыка на {0}.","<bonus_level_free_2>"),gls("Увеличивает количество применений навыка на {0}.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает количество применений навыка на {0}.","<bonus_level_paid_1>"),gls("Увеличивает количество применений навыка на {0}.","<bonus_level_paid_2>"),gls("Навык может быть применён на бегу и в прыжке.")]
               },
               "total":{
                  "free":[gls("{0} Количество применений навыка за раунд — {1}.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>","<descr_total_level_free_1> <descr_level_level_paid_3>"]
               }
            },
            "buttonClass":PerkShamanButton24,
            "bonuses":{
               "free":[1,1,1],
               "paid":[1,1,0]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-v1l§] = {
            "perkClass":§_-yV§,
            "name":gls("Капитан крюк"),
            "active":true,
            "description":{
               "default":gls("При активации позволяет бросить крюк, который цепляется к стенам и потолку."),
               "level":{
                  "free":[gls("{0} Сила броска увеличена на {1}%.","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает силу броска на {0}%.","<bonus_level_free_2>"),gls("Увеличивает силу броска на {0}%.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает силу броска на {0}%.","<bonus_level_paid_1>"),gls("Увеличивает силу броска на {0}%.","<bonus_level_paid_2>"),gls("Скорость подтягивания верёвки больше на {0}%.",§_-yV§.§_-z2K§)]
               },
               "total":{
                  "free":[gls("{0} Сила броска увеличена на {1}%.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>","<descr_total_level_free_1> <descr_level_level_paid_3>"]
               }
            },
            "buttonClass":PerkShamanButton25,
            "bonuses":{
               "free":[2,3,5],
               "paid":[10,15,0]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-82p§] = {
            "perkClass":§_-S1G§,
            "name":gls("Шустряк"),
            "active":true,
            "description":{
               "default":gls("При активации увеличивает скорость передвижения шамана. Время действия навыка — 10 секунд."),
               "level":{
                  "free":[gls("{0} Скорость передвижения шамана увеличена на {1}%.","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает скорость передвижения шамана на {0}%.","<bonus_level_free_2>"),gls("Увеличивает скорость передвижения шамана на {0}%.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает скорость передвижения шамана на {0}%.","<bonus_level_paid_1>"),gls("Увеличивает скорость передвижения шамана на {0}%.","<bonus_level_paid_2>"),gls("Вблизи шамана белки получают бонус к скорости.")]
               },
               "total":{
                  "free":[gls("{0} Скорость передвижения шамана увеличена на {1}%.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>",gls("Увеличивает скорость передвижения шамана и белок рядом с ним на {0}%. Время действия навыка — 10 секунд.","<bonus_total>")]
               },
               "buff":{
                  "free":["","",""],
                  "paid":["","",gls("Увеличивает скорость передвижения шамана и белок рядом с ним на {0}%.","<bonus_total>")]
               }
            },
            "buttonClass":PerkShamanButton26,
            "bonuses":{
               "free":[1,2,3],
               "paid":[3,5,0]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-mg§] = {
            "perkClass":§_-d2K§,
            "name":gls("Ленивый шаман"),
            "active":false,
            "description":{
               "default":gls("Шаману больше не требуется заходить в дупло. Применить навык можно, если в дупло зашло не менее 3 белок. Навык нельзя применить в начале раунда."),
               "level":{
                  "free":[gls("Шаману больше не требуется заходить в дупло. Применить навык можно, если в дупло зашла хотя бы одна белка. Навык может быть применён через — {0}{1} сек.",§_-d2K§.§_-P2q§,"<sub><bonus_level_free_1>"),gls("Воспользоваться навыком можно раньше на {0} сек.","<bonus_level_free_2>"),gls("Воспользоваться навыком можно раньше на {0} сек.","<bonus_level_free_3>")],
                  "paid":[gls("Воспользоваться навыком можно раньше на {0} сек.","<bonus_level_paid_1>"),gls("Воспользоваться навыком можно раньше на {0} сек.","<bonus_level_paid_2>"),gls("Чтобы зайти в дупло, шаману не требуется орех.")]
               },
               "total":{
                  "free":[gls("Шаману больше не требуется заходить в дупло. Применить навык можно, если в дупло зашло не менее 3 белок. Навык может быть применён через — {0}{1} сек.",§_-d2K§.§_-P2q§,"<sub><bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>","<descr_total_level_free_1> <descr_level_level_paid_3>"]
               }
            },
            "buttonClass":PerkShamanButton27,
            "bonuses":{
               "free":[20,20,20],
               "paid":[30,30,0]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-F1S§] = {
            "perkClass":§_-g2U§,
            "name":gls("Повелитель времени"),
            "active":true,
            "description":{
               "default":gls("При активации возвращает шамана на место, где он был несколько секунд назад. Время восстановления навыка — 1 мин."),
               "level":{
                  "free":[gls("{0} Возвращает время на {1} сек.","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает время возвращения назад на {0} сек.","<bonus_level_free_2>"),gls("Увеличивает время возвращения назад на {0} сек.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает время возвращения назад на {0} сек.","<bonus_level_paid_1>"),gls("Увеличивает время возвращения назад на {0} сек.","<bonus_level_paid_2>"),gls("Белки вблизи шамана возвращаются во времени.")]
               },
               "total":{
                  "free":[gls("{0} Возвращает время на {1} сек.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>",gls("Возвращает шамана и стоящих рядом с ним белок на место, где они были несколько секунд назад. Возвращает время на <bonus_total> сек. Время восстановления навыка — 1 мин.")]
               }
            },
            "buttonClass":PerkShamanButton28,
            "bonuses":{
               "free":[1,2,3],
               "paid":[3,5,0]
            },
            "gold_cost":[50,50,5]
         };
         perkData[§_-oS§] = {
            "perkClass":§_-K1y§,
            "name":gls("Концентрация"),
            "active":false,
            "description":{
               "default":gls("Позволяет устанавливать предметы во время передвижения. Радиус области для создания предметов на бегу вдвое меньше обычного."),
               "level":{
                  "free":[gls("{0} Радиус области создания предметов на бегу увеличен на {1}%.","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает радиус области создания предметов на бегу на {0}%.","<bonus_level_free_2>"),gls("Увеличивает радиус области создания предметов на бегу на {0}%.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает радиус области создания предметов на бегу на {0}%.","<bonus_level_paid_1>"),gls("Увеличивает радиус области создания предметов на бегу на {0}%.","<bonus_level_paid_2>"),gls("Увеличивает радиус области создания предметов на бегу на {0}%.","<bonus_level_paid_3>")]
               },
               "total":{
                  "free":[gls("{0} Радиус области создания предметов на бегу увеличен на {1}%.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>","<descr_total_level_free_1>"]
               }
            },
            "buttonClass":PerkShamanButton29,
            "bonuses":{
               "free":[5,5,10],
               "paid":[10,20,20]
            },
            "gold_cost":[50,50,5]
         };
         perkData[§_-01S§] = {
            "perkClass":§_-U2A§,
            "name":gls("Умелец"),
            "active":false,
            "description":{
               "default":gls("Снижает время на создание предметов."),
               "level":{
                  "free":[gls("Время создания предметов снижено на {0}%.","<bonus_level_free_1>"),gls("Уменьшает время создания предметов на {0}%.","<bonus_level_free_2>"),gls("Уменьшает время создания предметов на {0}%.","<bonus_level_free_3>")],
                  "paid":[gls("Уменьшает время создания предметов на {0}%.","<bonus_level_paid_1>"),gls("Уменьшает время создания предметов на {0}%.","<bonus_level_paid_2>"),gls("Уменьшает время создания предметов на {0}%.","<bonus_level_paid_3>")]
               },
               "total":{
                  "free":[gls("Время создания предметов снижено на {0}%.","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>","<descr_level_level_paid_3>"]
               }
            },
            "buttonClass":PerkShamanButton30,
            "bonuses":{
               "free":[2,3,5],
               "paid":[10,15,58]
            },
            "gold_cost":[50,50,5]
         };
         perkData[§_-M1H§] = {
            "perkClass":§_-SN§,
            "name":gls("Карманный телепорт"),
            "active":true,
            "description":{
               "default":gls("При активации перемещает шамана в указанную точку. Восстановление навыка — 45 сек. Навык нельзя применить сразу после того, как игрок стал шаманом."),
               "level":{
                  "free":[gls("{0} Область перемещения увеличена на {1}%.","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает область перемещения на {0}%.","<bonus_level_free_2>"),gls("Увеличивает область перемещения на {0}%.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает область перемещения на {0}%.","<bonus_level_paid_1>"),gls("Увеличивает область перемещения на {0}%.","<bonus_level_paid_2>"),gls("Радиус применения навыка неограничен.")]
               },
               "total":{
                  "free":[gls("{0} Область перемещения увеличена на {1}%.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>",gls("Перемещает шамана на выбранную позицию. Восстановление навыка — 45 сек. Навык нельзя применить сразу после того, как игрок стал шаманом. {0}","<descr_level_level_paid_3>")]
               }
            },
            "buttonClass":PerkShamanButton31,
            "bonuses":{
               "free":[40,60,80],
               "paid":[100,150,0]
            },
            "gold_cost":[70,70,5]
         };
         perkData[§_-u1I§] = {
            "perkClass":§_-Z1z§,
            "name":gls("Райские врата"),
            "active":true,
            "description":{
               "default":gls("При активации устанавливает райские врата для воскрешения погибших белок. Навык можно применять дважды за раунд."),
               "level":{
                  "free":[gls("{0} Время жизни ворот — {1} сек.","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает время жизни ворот на {0} сек.","<bonus_level_free_2>"),gls("Увеличивает время жизни ворот на {0} сек.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает время жизни ворот на {0} сек.","<bonus_level_paid_1>"),gls("Увеличивает время жизни ворот на {0} сек.","<bonus_level_paid_2>"),gls("Увеличивает время жизни ворот на {0} сек. Ворота следуют за шаманом.","<bonus_level_paid_3>")]
               },
               "total":{
                  "free":[gls("{0} Время жизни ворот — {1} сек.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>",gls("{0} Ворота следуют за шаманом.","<descr_total_level_free_1>")]
               }
            },
            "buttonClass":PerkShamanButton32,
            "bonuses":{
               "free":[1,2,3],
               "paid":[3,5,5]
            },
            "gold_cost":[70,70,5]
         };
         perkData[§_-B1u§] = {
            "perkClass":§_-WC§,
            "name":gls("Сосредоточение"),
            "active":false,
            "description":{
               "default":gls("Увеличивает радиус создания предметов."),
               "level":{
                  "free":[gls("{0} Радиус создания предметов увеличен на {1}%.","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает радиус создания предметов на {0}%.","<bonus_level_free_2>"),gls("Увеличивает радиус создания предметов на {0}%.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает радиус создания предметов на {0}%.","<bonus_level_paid_1>"),gls("Увеличивает радиус создания предметов на {0}%.","<bonus_level_paid_2>"),gls("Увеличивает радиус создания предметов на {0}%. Радиус создания предметов виден всегда.","<bonus_level_paid_3>")]
               },
               "total":{
                  "free":[gls("{0} Радиус создания предметов увеличен на {1}%.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>",gls("{0} Радиус создания предметов виден всегда.","<descr_total_level_free_1>")]
               }
            },
            "buttonClass":PerkShamanButton33,
            "bonuses":{
               "free":[2,3,5],
               "paid":[10,15,15]
            },
            "gold_cost":[70,70,5]
         };
         perkData[§_-a1c§] = {
            "perkClass":§_-121§,
            "name":gls("Бессмертный шаман"),
            "active":true,
            "description":{
               "default":gls("При активации шаман становится бессмертным. Время восстановления навыка — 60 секунд."),
               "level":{
                  "free":[gls("{0} Длительность навыка — {1} сек.","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает длительность навыка на {0} сек.","<bonus_level_free_2>"),gls("Увеличивает длительность навыка на {0} сек. Увеличивает количество применений на {1}.","<bonus_level_free_3>","<extraBonus_level_free_3>")],
                  "paid":[gls("Увеличивает длительность навыка на {0} сек.","<bonus_level_paid_1>"),gls("Увеличивает длительность навыка на {0} сек.","<bonus_level_paid_2>"),gls("Увеличивает длительность навыка на {0} сек. Увеличивает количество применений на {1}.","<bonus_level_paid_3>","<extraBonus_level_paid_3>")]
               },
               "total":{
                  "free":[gls("{0} Длительность навыка — {1} сек. Количество применений навыка за раунд — {2}.","<descr_default>","<bonus_total>","<extraBonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>","<descr_total_level_free_1>"]
               }
            },
            "buttonClass":PerkShamanButton34,
            "bonuses":{
               "free":[1,2,3],
               "paid":[3,5,2]
            },
            "extraBonuses":{
               "free":[1,0,1],
               "paid":[1,0,1]
            },
            "gold_cost":[70,70,5]
         };
         perkData[§_-N2s§] = {
            "perkClass":§_-w2h§,
            "name":gls("Динамит"),
            "active":true,
            "description":{
               "default":gls("При активации взрывает динамит в указанной точке и отбрасывает белок. Требуется время на восстановление навыка."),
               "level":{
                  "free":[gls("При активации взрывает динамит в указанной точке и отбрасывает белок. Время восстановления навыка — {0}{1} сек.",§_-w2h§.§_-P2q§,"<sub><bonus_level_free_1>"),gls("Снижает время восстановления навыка на {0} сек.","<bonus_level_free_2>"),gls("Увеличивает мощность динамита на {0}%.",§_-w2h§.§_-X1F§)],
                  "paid":[gls("Снижает время восстановления навыка на {0} сек.","<bonus_level_paid_1>"),gls("Увеличивает радиус действия динамита на {0}%.",§_-w2h§.§_-v14§),gls("Динамит не действует на шамана.")]
               },
               "total":{
                  "free":[gls("При активации взрывает динамит в указанной точке и отбрасывает белок. Время восстановления навыка — {0}{1} сек.",§_-w2h§.§_-P2q§,"<sub><bonus_total>"),"<descr_total_level_free_1>",gls("{0} Мощность динамита увеличена на {1}%.","<descr_total_level_free_1>",§_-w2h§.§_-X1F§)],
                  "paid":["<descr_total_level_free_1>",gls("{0} Радиус действия динамита увеличен на {1}%.","<descr_total_level_free_1>",§_-w2h§.§_-v14§),"<descr_total_level_free_3> <descr_total_level_paid_2> <descr_level_level_paid_3>"]
               }
            },
            "buttonClass":PerkShamanButton35,
            "bonuses":{
               "free":[2,3,0],
               "paid":[5,0,0]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-CX§] = {
            "perkClass":§_-W22§,
            "name":gls("Гелий"),
            "active":false,
            "description":{
               "default":gls("Увеличивает подъёмную силу шаров."),
               "level":{
                  "free":[gls("Подъёмная сила шаров увеличена на {0}%.","<bonus_level_free_1>"),gls("Увеличивает подъёмную силу шаров на {0}%.","<bonus_level_free_2>"),gls("Увеличивает подъёмную силу шаров на {0}%","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает подъёмную силу шаров на {0}%","<bonus_level_paid_1>"),gls("Увеличивает подъёмную силу шаров на {0}%.","<bonus_level_paid_2>"),gls("Шары создаются по 2 штуки и крепятся к одной точке.")]
               },
               "total":{
                  "free":[gls("Подъёмная сила шаров увеличена на {0}%.","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>","<descr_total_level_free_1> <descr_level_level_paid_3>"]
               }
            },
            "buttonClass":PerkShamanButton36,
            "bonuses":{
               "free":[2,3,5],
               "paid":[10,15,0]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-Kh§] = {
            "perkClass":§_-qg§,
            "name":gls("Тяжёлая гиря"),
            "active":false,
            "description":{
               "default":gls("Увеличивает вес гири."),
               "level":{
                  "free":[gls("Вес гири увеличен на {0}%.","<bonus_level_free_1>"),gls("Увеличивает вес гири на {0}%.","<bonus_level_free_2>"),gls("Увеличивает вес гири на {0}>%","<bonus_level_free_3")],
                  "paid":[gls("Увеличивает вес гири на {0}>%","<bonus_level_paid_1"),gls("Увеличивает вес гири на {0}%.","<bonus_level_paid_2>"),gls("Гиря исчезает через 30 секунд.")]
               },
               "total":{
                  "free":[gls("Вес гири увеличен на {0}%.","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>","<descr_total_level_free_1> <descr_level_level_paid_3>"]
               }
            },
            "buttonClass":PerkShamanButton37,
            "bonuses":{
               "free":[2,3,5],
               "paid":[10,15,0]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-82B§] = {
            "perkClass":§_-b21§,
            "name":gls("Помощник"),
            "active":true,
            "description":{
               "default":gls("При активации перемещает выбранную белку из любого места карты в указанную точку вблизи шамана. Время восстановления навыка — 1 мин."),
               "level":{
                  "free":[gls("{0} Область для перемещения увеличена на  {1}%.","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает область для перемещения на {0}%.","<bonus_level_free_2>"),gls("Увеличивает область для перемещения на {0}%","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает область для перемещения на {0}%","<bonus_level_paid_1>"),gls("Увеличивает область для перемещения на {0}%.","<bonus_level_paid_2>"),gls("Увеличивает область для перемещения на {0}%.","<bonus_level_paid_3>")]
               },
               "total":{
                  "free":[gls("{0} Область для перемещения увеличена на  {1}%.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>","<descr_total_level_free_1>"]
               }
            },
            "buttonClass":PerkShamanButton38,
            "bonuses":{
               "free":[10,20,30],
               "paid":[20,30,100]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-Xs§] = {
            "perkClass":§_-1K§,
            "name":gls("Скачок"),
            "active":true,
            "description":{
               "default":gls("При активации увеличивает дальность прыжка."),
               "level":{
                  "free":[gls("При активации увеличивает дальность прыжка. Время действия навыка — 10 секунд. Дальность прыжка увеличена на {0}%.","<bonus_level_free_1>"),gls("Увеличивает дальность прыжка на {0}%.","<bonus_level_free_2>"),gls("Увеличивает дальность прыжка на {0}%.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает дальность прыжка на {0}%.","<bonus_level_paid_1>"),gls("Увеличивает дальность прыжка на {0}%.","<bonus_level_paid_2>"),gls("Увеличивает время действия навыка на 5 секунд.")]
               },
               "total":{
                  "free":[gls("При активации увеличивает дальность прыжка. Время действия навыка — 10 секунд. Дальность прыжка увеличена на {0}%.","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>","При активации увеличивает дальность прыжка. Время действия навыка — 15 секунд. Дальность прыжка увеличена на <bonus_total>%."]
               }
            },
            "buttonClass":PerkShamanButton39,
            "bonuses":{
               "free":[10,20,20],
               "paid":[30,50,0]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-a1o§] = {
            "perkClass":§_-E1o§,
            "name":gls("Билет в одну сторону"),
            "active":true,
            "description":{
               "default":gls("При активации создаёт балку, сквозь которую можно пройти только в одну сторону. Время жизни балки ограничено."),
               "level":{
                  "free":[gls("При активации создаёт балку, сквозь которую можно пройти только в одну сторону. Время жизни балки — 15 сек. Количество применений навыка за раунд — {0}.","<bonus_level_free_1>"),gls("Увеличивает количество применений навыка на {0}.","<bonus_level_free_2>"),gls("Увеличивает количество применений навыка на {0}.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает количество применений навыка на {0}.","<bonus_level_paid_1>"),gls("Увеличивает количество применений навыка на {0}.","<bonus_level_paid_2>"),gls("Время жизни балки неограничено. Можно развернуть все балки наоборот.")]
               },
               "total":{
                  "free":[gls("При активации создаёт балку, сквозь которую можно пройти только в одну сторону. Время жизни балки — 15 сек. Количество применений навыка за раунд — {0}.","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>",gls("При активации создаёт балку, сквозь которую можно пройти только в одну сторону. {0} Количество применений навыка за раунд — {1}.","<descr_level_level_paid_3>","<bonus_total>")]
               }
            },
            "buttonClass":PerkShamanButton40,
            "bonuses":{
               "free":[1,1,2],
               "paid":[2,3,0]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-N1r§] = {
            "perkClass":§_-h1r§,
            "name":gls("Перевернуть балку"),
            "active":true,
            "description":{
               "default":gls("При активации разворачивает все односторонние балки на локации."),
               "total":{
                  "free":["<descr_default>","<descr_default>","<descr_default>"],
                  "paid":["<descr_default>","<descr_default>","<descr_default>"]
               }
            },
            "buttonClass":PerkShamanButton40
         };
         perkData[§_-l1z§] = {
            "perkClass":§_-C1k§,
            "name":gls("Таймер"),
            "active":true,
            "description":{
               "default":gls("При активации создаёт короткую балку с ограниченным временем жизни."),
               "level":{
                  "free":[gls("{0} Время жизни балки — {1} сек.","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает время жизни балки на {0} сек.","<bonus_level_free_2>"),gls("Увеличивает время жизни балки на {0} сек.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает время жизни балки на {0} сек.","<bonus_level_paid_1>"),gls("Увеличивает время жизни балки на {0} сек.","<bonus_level_paid_2>"),gls("Увеличивает время жизни балки на {0} сек. Увеличивает длину балки.","<bonus_level_paid_3>")]
               },
               "total":{
                  "free":[gls("{0} Время жизни балки — {1} сек.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>",gls("{0} Увеличивает длину балки.","<descr_total_level_free_1>")]
               }
            },
            "buttonClass":PerkShamanButton41,
            "bonuses":{
               "free":[1,2,2],
               "paid":[3,5,2]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-Au§] = {
            "perkClass":§_-U16§,
            "name":gls("Оплот"),
            "active":true,
            "description":{
               "default":gls("При активации устанавливает тотем. Вокруг тотема можно создавать предметы. Время жизни тотема — 1 минута. Время восстановления навыка — 1 минута."),
               "level":{
                  "free":[gls("{0} Размер области создания тотема увеличен на {1}%.","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает размер области создания тотема на {0}%.","<bonus_level_free_2>"),gls("Увеличивает размер области создания тотема на {0}%.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает размер области создания тотема на {0}%.","<bonus_level_paid_1>"),gls("Увеличивает размер области создания тотема на {0}%.","<bonus_level_paid_2>"),gls("Увеличивает размер области создания тотема на {0}%. Позволяет установить два тотема.","<bonus_level_paid_3>")]
               },
               "total":{
                  "free":[gls("{0} Размер области создания тотема увеличен на {1}%.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>",gls("Позволяет установить два тотема. Вокруг тотемов можно создавать предметы. Время жизни каждого тотема — 1 минута. Время восстановления навыка — 1 минута. Размер области создания тотема увеличен на {0}%.","<bonus_total>")]
               }
            },
            "buttonClass":PerkShamanButton47,
            "bonuses":{
               "free":[2,3,5],
               "paid":[10,15,10]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-a2F§] = {
            "perkClass":§_-am§,
            "name":gls("Духи предков"),
            "active":true,
            "description":{
               "default":gls("При активации позволяет белкам наступать на прозрачные предметы."),
               "level":{
                  "free":[gls("{0} Время действия навыка — {1} сек.","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает время действия навыка на {0} сек.","<bonus_level_free_2>"),gls("Увеличивает время действия навыка на {0} сек.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает время действия навыка на {0} сек.","<bonus_level_paid_1>"),gls("Увеличивает время действия навыка на {0} сек.","<bonus_level_paid_2>"),gls("Все прозрачные объекты становятся видимыми на время действия навыка.")]
               },
               "total":{
                  "free":[gls("{0} Время действия навыка — {1} сек.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>","<descr_total_level_free_1> <descr_level_level_paid_3>"]
               },
               "buff":{
                  "free":["<descr_default>","<descr_default>","<descr_default>"],
                  "paid":["<descr_default>","<descr_default>","<descr_default>"]
               }
            },
            "buttonClass":PerkShamanButton43,
            "bonuses":{
               "free":[1,2,2],
               "paid":[3,5,0]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-k1B§] = {
            "perkClass":§_-320§,
            "name":gls("Замедление времени"),
            "active":true,
            "description":{
               "default":gls("При активации временно замедляет все движущиеся механизмы."),
               "level":{
                  "free":[gls("{0} Время действия навыка — {1} сек. Механизмы замедляются на {2}%.","<descr_default>","<bonus_level_free_1>","<extraBonus_level_free_1>"),gls("Увеличивает время действия навыка на {0} сек. Увеличивает замедление механизмов на {1}%.","<bonus_level_free_2>","<extraBonus_level_free_2>"),gls("Увеличивает время действия навыка на {0} сек. Увеличивает замедление механизмов на {1}%.","<bonus_level_free_3>","<extraBonus_level_free_3>")],
                  "paid":[gls("Увеличивает время действия навыка на {0} сек. Увеличивает замедление механизмов на {1}%.","<bonus_level_paid_1>","<extraBonus_level_paid_1>"),gls("Увеличивает время действия навыка на {0} сек. Увеличивает замедление механизмов на {1}%.","<bonus_level_paid_2>","<extraBonus_level_paid_2>"),gls("Увеличивает время действия навыка на {0} сек. Увеличивает замедление механизмов на {1}%.","<bonus_level_paid_3>","<extraBonus_level_paid_3>")]
               },
               "total":{
                  "free":[gls("{0} Время действия навыка — {1} сек. Механизмы замедляются на {2}%.","<descr_default>","<bonus_total>","<extraBonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>","<descr_total_level_free_1>"]
               }
            },
            "buttonClass":PerkShamanButton44,
            "bonuses":{
               "free":[1,2,2],
               "paid":[3,5,2]
            },
            "extraBonuses":{
               "free":[10,15,20],
               "paid":[20,25,10]
            },
            "gold_cost":[35,35,5]
         };
         perkData[§_-93§] = {
            "perkClass":§_-Q1R§,
            "name":gls("Гроза"),
            "active":true,
            "description":{
               "default":gls("Позволяет вызывать грозовое облако. Вблизи облака белки получают бонус к скорости передвижения 15%. Время восстановления навыка — 50 секунд."),
               "level":{
                  "free":[gls("{0} Бонус к скорости действует в течение {1} сек. Время жизни грозового облака — {2} сек.","<descr_default>","<bonus_level_free_1>","<extraBonus_level_free_1>"),gls("Увеличивает время действия бонуса скорости на {0} сек.","<bonus_level_free_2>"),gls("Увеличивает время действия бонуса скорости на {0} сек.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает время действия бонуса скорости на {0} сек. и время жизни грозового облака на {1} сек.","<bonus_level_paid_1>","<extraBonus_level_paid_1>"),gls("Увеличивает время действия бонуса скорости на {0} сек. и время жизни грозового облака на {1} сек.","<bonus_level_paid_2>","<extraBonus_level_paid_2>"),gls("Увеличивает время действия бонуса скорости на {0} сек. и время жизни грозового облака на {1} сек.","<bonus_level_paid_3>","<extraBonus_level_paid_3>")]
               },
               "total":{
                  "free":[gls("{0} Бонус к скорости действует в течение {1} сек. Время жизни грозового облака — {2} сек.","<descr_default>","<bonus_total>","<extraBonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>","<descr_total_level_free_1>"]
               }
            },
            "buttonClass":PerkShamanButton50,
            "bonuses":{
               "free":[5,2,3],
               "paid":[3,3,4]
            },
            "extraBonuses":{
               "free":[10,0,0],
               "paid":[4,5,6]
            },
            "gold_cost":[50,50,5]
         };
         perkData[§_-y1Q§] = {
            "perkClass":§_-R2F§,
            "name":gls("Грави-блок"),
            "active":true,
            "description":{
               "default":gls("При активации создаёт грави-блок. В зоне действия грави-блока повышена сила гравитации. Время существования блока ограничено. Требуется время на восстановление навыка."),
               "level":{
                  "free":[gls("При активации создаёт грави-блок. В зоне действия грави-блока повышена сила гравитации. Время жизни грави-блока — 20 сек. Время восстановления навыка — 20 сек. Размер грави-блока увеличен на {0}%.","<bonus_level_free_1>"),gls("Увеличивает размер грави-блока на {0}%.","<bonus_level_free_2>"),gls("Увеличивает размер грави-блока на {0}%.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает размер грави-блока на <bonus_level_paid_1>%."),gls("Увеличивает размер грави-блока на <bonus_level_paid_2>%."),gls("Позволяет создать два грави-блока. Время жизни каждого грави-блока увеличено на 10 сек.")]
               },
               "total":{
                  "free":[gls("При активации создаёт грави-блок. В зоне действия грави-блока повышена сила гравитации. Время жизни грави-блока — 20 сек. Время восстановления навыка — 20 сек. Размер грави-блока увеличен на {0}%.","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>",gls("Позволяет создать два грави-блока. Время жизни каждого грави-блока — 30 сек. Время восстановления навыка — 15 сек. Размер грави-блока увеличен на {0}%.","<bonus_total>")]
               }
            },
            "buttonClass":PerkShamanButton46,
            "bonuses":{
               "free":[10,20,30],
               "paid":[20,30,0]
            },
            "gold_cost":[50,50,5]
         };
         perkData[§_-53z§] = {
            "perkClass":§_-02X§,
            "name":gls("Уничтожитель"),
            "active":true,
            "description":{
               "default":gls("При активации позволяет шаману удалить любой созданный им предмет в любой точке карты. Требуется время на восстановление навыка."),
               "level":{
                  "free":[gls("При активации позволяет шаману удалить любой построенный им предмет, независимо от радиуса области создания предметов. Время восстановления навыка — 10 сек. Количество применений навыка за раунд — {0}.","<bonus_level_free_1>"),gls("Увеличивает количество применений навыка на {0}.","<bonus_level_free_2>"),gls("Увеличивает количество применений навыка на {0}.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает количество применений навыка на {0}.","<bonus_level_paid_1>"),gls("Увеличивает количество применений навыка на {0}.","<bonus_level_paid_2>"),gls("Время восстановления навыка — 0 сек.")]
               },
               "total":{
                  "free":[gls("При активации позволяет шаману удалить любой построенный им предмет, независимо от радиуса области создания предметов. Время восстановления навыка — 10 сек. Количество применений навыка за раунд — {0}.","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>",gls("Позволяет шаману удалить любой созданный им предмет на всей карте. {0} Количество применений навыка за раунд — {1}.","<descr_level_level_paid_3>","<bonus_total>")]
               }
            },
            "buttonClass":PerkShamanButton42,
            "bonuses":{
               "free":[1,1,1],
               "paid":[2,2,0]
            },
            "gold_cost":[50,50,5]
         };
         perkData[§_-Q1U§] = {
            "perkClass":§_-dD§,
            "name":gls("Режим рисования"),
            "active":true,
            "description":{
               "default":gls("При активации позволяет создавать маленькие блоки, следующие один за другим. По блокам можно передвигаться."),
               "level":{
                  "free":[gls("{0} Время жизни блоков — {1} сек.","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает время жизни блоков на {0} сек.","<bonus_level_free_2>"),gls("Увеличивает время жизни блоков на {0} сек.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает время жизни блоков на {0} сек.","<bonus_level_paid_1>"),gls("Увеличивает время жизни блоков на {0} сек.","<bonus_level_paid_2>"),gls("Увеличивает время жизни блоков на {0} сек. Можно рисовать во время движения.","<bonus_level_paid_3>")]
               },
               "total":{
                  "free":[gls("{0} Время жизни блоков — {1} сек.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>",gls("{0} Можно рисовать во время движения.","<descr_total_level_free_1>")]
               }
            },
            "buttonClass":PerkShamanButton48,
            "bonuses":{
               "free":[1,2,2],
               "paid":[3,5,2]
            },
            "gold_cost":[70,70,5]
         };
         perkData[§_-g23§] = {
            "perkClass":§_-W2N§,
            "name":gls("Мастер порталов"),
            "active":true,
            "description":{
               "default":gls("При активации создаёт «мастер-портал» зелёного цвета, к которому телепортируются белки из красного и синего порталов. Из зелёного портала телепортироваться можно, если установлен только синий, либо только красный портал."),
               "level":{
                  "free":[gls("{0} Время жизни портала — {1} сек.","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает время жизни портала на {0} сек.","<bonus_level_free_2>"),gls("Увеличивает время жизни портала на {0} сек.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает время жизни портала на {0} сек.","<bonus_level_paid_1>"),gls("Увеличивает время жизни портала на {0} сек.","<bonus_level_paid_2>"),gls("Время жизни зелёного портала неограничено.")]
               },
               "total":{
                  "free":[gls("{0} Время жизни портала — {1} сек.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>","<descr_default> <descr_level_level_paid_3>"]
               }
            },
            "buttonClass":PerkShamanButton49,
            "bonuses":{
               "free":[5,5,10],
               "paid":[10,15,0]
            },
            "gold_cost":[70,70,5]
         };
         perkData[§_-A2A§] = {
            "perkClass":§_-I2§,
            "name":gls("Крановщик"),
            "active":true,
            "description":{
               "default":gls("При активации позволяет шаману создать предмет в любой точке карты. Требуется время на восстановление навыка."),
               "level":{
                  "free":[gls("При активации позволяет шаману создать предмет в любой точке карты. Время восстановления навыка — 20 сек. Время действия навыка — {0} сек.","<bonus_level_free_1>"),gls("Увеличивает время действия навыка на {0} сек.","<bonus_level_free_2>"),gls("Увеличивает время действия навыка на {0} сек.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает время действия навыка на {0} сек.","<bonus_level_paid_1>"),gls("Увеличивает время действия навыка на {0} сек.","<bonus_level_paid_2>"),gls("Навык активен постоянно.")]
               },
               "total":{
                  "free":[gls("При активации позволяет шаману создать предмет в любой точке карты. Время восстановления навыка — 20 сек. Время действия навыка — {0} сек.","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>",gls("При активации позволяет создать предмет в любой части карты, независимо от радиуса области создания предметов. {0}","<descr_level_level_paid_3>")]
               }
            },
            "buttonClass":PerkShamanButton45,
            "bonuses":{
               "free":[2,2,2],
               "paid":[4,5,0]
            },
            "gold_cost":[70,70,5]
         };
         perkData[§_-r1s§] = {
            "perkClass":§_-o1d§,
            "name":gls("Безопасный путь"),
            "active":true,
            "description":{
               "default":gls("При активации белки временно становятся бессмертными."),
               "level":{
                  "free":[gls("{0} Время действия навыка — {1} сек.","<descr_default>","<bonus_level_free_1>"),gls("Увеличивает время действия навыка на {0} сек.","<bonus_level_free_2>"),gls("Увеличивает время действия навыка на {0} сек.","<bonus_level_free_3>")],
                  "paid":[gls("Увеличивает время действия навыка на {0} сек.","<bonus_level_paid_1>"),gls("Увеличивает время действия навыка на {0} сек.","<bonus_level_paid_2>"),gls("В течение 2 секунд, после окончания действия навыка, белки воскрешаются вблизи шамана.")]
               },
               "total":{
                  "free":[gls("{0} Время действия навыка — {1} сек.","<descr_default>","<bonus_total>"),"<descr_total_level_free_1>","<descr_total_level_free_1>"],
                  "paid":["<descr_total_level_free_1>","<descr_total_level_free_1>","<descr_total_level_free_1> <descr_level_level_paid_3>"]
               },
               "buff":{
                  "free":["<descr_default>","<descr_default>","<descr_default>"],
                  "paid":["<descr_default>","<descr_default>","<descr_default> <descr_level_level_paid_3>"]
               }
            },
            "buttonClass":PerkShamanButton51,
            "bonuses":{
               "free":[1,2,2],
               "paid":[3,5,0]
            },
            "gold_cost":[70,70,5]
         };
      }
      
      public static function §_-xZ§(param1:int) : Class
      {
         return param1 in perkData ? perkData[param1]["perkClass"] : null;
      }
      
      public static function §_-03v§(param1:int, param2:String, param3:Array) : String
      {
         if(!(param1 in perkData))
         {
            return "";
         }
         if(!(param2 in perkData[param1]["description"]))
         {
            return "";
         }
         var _loc4_:int = param3 ? int(param3[0]) : 0;
         var _loc5_:int = param3 ? int(param3[1]) : 0;
         switch(param2)
         {
            case §_-l11§:
               return perkData[param1]["description"][§_-l11§];
            case §_-42e§:
               if(_loc4_ == 0)
               {
                  return §_-23d§(param1,_loc4_,_loc5_,perkData[param1]["description"][§_-42e§]["paid"][_loc5_ - 1]);
               }
               return §_-23d§(param1,_loc4_,_loc5_,perkData[param1]["description"][§_-42e§]["free"][_loc4_ - 1]);
               break;
            case §_-W2r§:
               if(_loc4_ == 0 && _loc5_ == 0)
               {
                  return perkData[param1]["description"][§_-l11§];
               }
               if(_loc5_ == 3)
               {
                  return §_-23d§(param1,_loc4_,_loc5_,perkData[param1]["description"][§_-W2r§]["paid"][_loc5_ - 1]);
               }
               return §_-23d§(param1,_loc4_,_loc5_,perkData[param1]["description"][§_-W2r§]["free"][_loc4_ - 1] + (_loc5_ != 0 ? " " + perkData[param1]["description"][§_-W2r§]["paid"][_loc5_ - 1] : ""));
               break;
            case §_-O2B§:
               if(_loc4_ == 0 && _loc5_ == 0)
               {
                  return perkData[param1]["description"][§_-l11§];
               }
               if(_loc5_ == 3)
               {
                  return §_-23d§(param1,_loc4_,_loc5_,perkData[param1]["description"][§_-O2B§]["paid"][_loc5_ - 1]);
               }
               return §_-23d§(param1,_loc4_,_loc5_,perkData[param1]["description"][§_-O2B§]["free"][_loc4_ - 1] + (_loc5_ != 0 ? " " + perkData[param1]["description"][§_-O2B§]["paid"][_loc5_ - 1] : ""));
               break;
            default:
               return "";
         }
      }
      
      public static function §_-k19§(param1:int, param2:Array) : String
      {
         if(!(param1 in perkData))
         {
            return "";
         }
         if(!(§_-W2r§ in perkData[param1]["description"]))
         {
            return "";
         }
         var _loc3_:int = param2 ? int(param2[0]) : 0;
         var _loc4_:int = param2 ? int(param2[1]) : 0;
         if(_loc3_ == 0 && _loc4_ == 0)
         {
            return perkData[param1]["description"][§_-l11§];
         }
         if(_loc4_ == 3)
         {
            return §_-23d§(param1,_loc3_,_loc4_,perkData[param1]["description"][§_-W2r§]["paid"][_loc4_ - 1],true);
         }
         return §_-23d§(param1,_loc3_,_loc4_,perkData[param1]["description"][§_-W2r§]["free"][_loc3_ - 1] + (_loc4_ != 0 ? " " + perkData[param1]["description"][§_-W2r§]["paid"][_loc4_ - 1] : ""),true);
      }
      
      private static function §_-23d§(param1:int, param2:int, param3:int, param4:String, param5:Boolean = false) : String
      {
         var _loc7_:Array = null;
         var _loc8_:String = null;
         var _loc9_:Array = null;
         var _loc10_:String = null;
         var _loc12_:* = 0;
         var _loc13_:String = null;
         var _loc14_:Boolean = false;
         var _loc15_:String = null;
         var _loc16_:String = null;
         var _loc6_:String = param4.concat();
         while(true)
         {
            _loc7_ = _loc6_.match(/<descr_total[a-zA-Z_0-9]*>/g);
            _loc7_ = _loc7_.concat(_loc6_.match(/<descr_level[a-zA-Z_0-9]*>/g));
            _loc7_ = _loc7_.concat(_loc6_.match(/<descr_buff[a-zA-Z_0-9]*>/g));
            if(_loc7_.length == 0)
            {
               break;
            }
            _loc12_ = int(_loc7_.length - 1);
            while(_loc12_ >= 0)
            {
               _loc8_ = _loc7_[_loc12_] as String;
               _loc9_ = _loc8_.slice(1,_loc7_[_loc12_].length - 1).split("_");
               _loc13_ = perkData[param1]["description"][_loc9_[1]][_loc9_[3]][_loc9_[4] - 1];
               _loc6_ = _loc6_.replace(_loc8_,_loc6_.match(_loc13_) == null ? _loc13_ : "");
               _loc12_--;
            }
         }
         _loc7_ = _loc6_.match(/<[a-zA-Z_0-9]*>/g);
         _loc12_ = 0;
         for(; _loc12_ < _loc7_.length; _loc12_++)
         {
            _loc8_ = _loc7_[_loc12_];
            _loc9_ = _loc8_.slice(1,_loc7_[_loc12_].length - 1).split("_");
            _loc10_ = "";
            if(_loc8_.match("extraBonus_level"))
            {
               _loc10_ = String(perkData[param1]["extraBonuses"][_loc9_[2]][_loc9_[3] - 1]);
            }
            else if(_loc8_.match("bonus_level"))
            {
               _loc10_ = String(perkData[param1]["bonuses"][_loc9_[2]][_loc9_[3] - 1]);
            }
            else if(_loc8_.match("extraBonus_total"))
            {
               _loc10_ = String(§_-qC§.§_-zk§(param2,param3,perkData[param1]["extraBonuses"]));
            }
            else if(_loc8_.match("bonus_total"))
            {
               _loc10_ = String(§_-qC§.§_-zk§(param2,param3,perkData[param1]["bonuses"]));
            }
            else if(_loc8_.match("descr_default"))
            {
               _loc6_ = _loc6_.replace(_loc8_,String(perkData[param1]["description"][§_-l11§]));
               continue;
            }
            if(_loc10_ != "")
            {
               if(param5)
               {
                  _loc14_ = false;
                  if(_loc12_ != 0 && _loc7_[_loc12_ - 1] == "<sub>")
                  {
                     _loc14_ = true;
                  }
                  else if(_loc12_ != _loc7_.length - 1 && _loc7_[_loc12_ + 1] == "<sub>")
                  {
                     _loc14_ = true;
                  }
                  if(!_loc14_)
                  {
                     _loc10_ = §_-xb§.span(_loc10_,"number");
                  }
               }
               _loc6_ = _loc6_.replace(_loc8_,_loc10_);
            }
         }
         var _loc11_:Array = _loc6_.match(/[0-9]+<su[mb]>[0-9]+/g);
         _loc12_ = 0;
         while(_loc12_ < _loc11_.length)
         {
            _loc8_ = _loc11_[_loc12_];
            _loc15_ = _loc8_.match(/<su[mb]>/).pop();
            _loc9_ = _loc8_.split(_loc15_);
            switch(_loc15_)
            {
               case "<sub>":
                  _loc16_ = String(int(_loc9_[0]) - int(_loc9_[1]));
                  if(param5)
                  {
                     _loc16_ = §_-xb§.span(_loc16_,"number");
                  }
                  _loc6_ = _loc6_.replace(_loc8_,_loc16_);
            }
            _loc12_++;
         }
         return _loc6_.replace("  "," ");
      }
      
      public static function §_-41g§(param1:int) : Class
      {
         return perkData[param1]["buttonClass"];
      }
   }
}

