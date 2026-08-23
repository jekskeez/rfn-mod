package §_-p1f§
{
   import §_-Kr§.§_-h1x§;
   import §_-l26§.§_-32A§;
   import §_-l26§.§_-43M§;
   import §_-l26§.§_-i1J§;
   import fl.data.DataProvider;
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.utils.Endian;
   import protocol.§_-U1M§;
   
   public class §_-a2R§ extends §_-6Y§
   {
      
      private static const §_-O2f§:int = 2;
      
      private static const DATA:Array = [{
         "name":"Напарник",
         "value":[[5,4,4,3,3,2],[10,8,8,6,6,4]]
      },{
         "name":"Срочная доставка",
         "value":[[5,5,5,5,5,5],[10,10,10,10,10,10]]
      },{
         "name":"Без жалости",
         "value":[[1,1,1,1,1,1],[3,3,3,3,3,3]]
      },{
         "name":"Скрытые сокровища",
         "value":[[20,18,15,8,7,5],[30,28,25,18,16,14]]
      },{
         "name":"Дикие орехи",
         "value":[[6,5,4,2,2,1],[15,12,8,6,6,3]]
      },{
         "name":"Руками не трогать!",
         "value":[[5,4,4,3,3,1],[10,8,8,6,6,2]]
      },{
         "name":"Золотая лихорадка",
         "value":[[20,18,15,8,7,5],[30,28,25,18,16,14]]
      },{
         "name":"Терпение",
         "value":[[5,4,4,3,3,1],[10,8,8,6,6,2]]
      },{
         "name":"Аномальный дождь",
         "value":[[20,18,15,8,7,4],[40,36,34,28,26,20]]
      },{
         "name":"Кладоискатель",
         "value":[[7,6,6,5,5,4],[15,12,12,10,10,8]]
      },{
         "name":"Совершенно секретно",
         "value":[[5,4,4,3,3,1],[10,8,8,6,6,2]]
      },{
         "name":"Наперегонки",
         "value":[[5,4,4,3,3,2],[10,8,8,6,6,4]]
      },{
         "name":"Внутренний страх",
         "value":[[5,4,4,2,2,1],[10,8,8,5,5,3]]
      },{
         "name":"Экстракт бессмертия",
         "value":[[5,5,5,10,10,10],[15,15,15,30,30,30]]
      }];
      
      private static const §_-51L§:Array = [§_-q1p§.§_-C25§,§_-q1p§.§_-w2u§,§_-q1p§.§_-sL§,§_-q1p§.§_-P4§,§_-q1p§.§_-Q1s§,§_-q1p§.§_-u2u§];
      
      private static const §_-Nr§:Array = ["Солнечные долины","Снежные хребты","Топи","Пустыня","Шторм","Аномальная зона"];
      
      private var quests:Array = [];
      
      private var §_-82k§:DataProvider = null;
      
      private var §_-ss§:DataProvider = null;
      
      public function §_-a2R§()
      {
         super(§_-6Y§.§_-x2g§);
      }
      
      override public function load(param1:*) : void
      {
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < §_-O2f§)
         {
            _loc3_ = this.quests[_loc2_];
            _loc3_["container"].visible = false;
            if(param1.length > _loc2_ * 4)
            {
               _loc4_ = int(param1[_loc2_ * 4]);
               if(_loc4_ < DATA.length)
               {
                  _loc3_["container"].visible = true;
                  (_loc3_["type"] as §_-h1x§).§_-Uf§ = _loc4_;
                  (_loc3_["loc"] as §_-h1x§).§_-Uf§ = this.§_-AY§(param1[_loc2_ * 4 + 1]);
                  _loc3_["progress"].text = param1[_loc2_ * 4 + 2].toString();
                  _loc3_["time"] = param1[_loc2_ * 4 + 3];
                  this.§_-41§(_loc2_);
               }
            }
            _loc2_++;
         }
      }
      
      override public function save() : §_-U1M§
      {
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc1_:§_-U1M§ = new §_-U1M§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-s15§(§_-O2f§ * 4);
         var _loc2_:int = 0;
         while(_loc2_ < §_-O2f§)
         {
            _loc3_ = this.quests[_loc2_];
            if(_loc3_["container"].visible)
            {
               _loc4_ = int((_loc3_["type"] as §_-h1x§).§_-l1§["value"]);
               _loc5_ = int((_loc3_["loc"] as §_-h1x§).§_-l1§["value"]);
               _loc6_ = int(_loc3_["progress"].text);
               _loc7_ = int(_loc3_["time"]);
               _loc1_.§_-s15§(_loc4_);
               _loc1_.§_-s15§(_loc5_);
               _loc1_.§_-s15§(_loc6_);
               _loc1_.§_-s15§(_loc7_);
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      override protected function §_-X26§() : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:§_-h1x§ = null;
         var _loc4_:§_-h1x§ = null;
         var _loc5_:TextField = null;
         var _loc6_:§_-i1J§ = null;
         this.§_-o2o§();
         var _loc1_:int = 0;
         while(_loc1_ < §_-O2f§)
         {
            _loc2_ = new Sprite();
            _loc2_.x = _loc1_ * 220;
            this.§_-HL§.addChild(_loc2_);
            _loc2_.addChild(new §_-i1J§("Тип:",0,0,§_-32A§.§_-53t§));
            _loc3_ = new §_-h1x§(200);
            _loc3_.§_-gx§ = this.§_-82k§;
            _loc3_.x = 0;
            _loc3_.y = 20;
            _loc2_.addChild(_loc3_);
            _loc2_.addChild(new §_-i1J§("Локация:",0,60,§_-32A§.§_-53t§));
            _loc4_ = new §_-h1x§(200);
            _loc4_.§_-gx§ = this.§_-ss§;
            _loc4_.x = 0;
            _loc4_.y = 80;
            _loc2_.addChild(_loc4_);
            _loc2_.addChild(new §_-i1J§("Прогресс:",0,120,§_-32A§.§_-53t§));
            _loc5_ = new TextField();
            §_-43M§.§_-22h§(_loc5_,_loc2_,60,120,50,18,10,true);
            _loc6_ = new §_-i1J§("",115,120,§_-32A§.§_-53t§);
            _loc2_.addChild(_loc6_);
            if(_loc1_ > 0)
            {
               _loc2_.graphics.lineStyle(2,10066329);
               _loc2_.graphics.moveTo(-15,20);
               _loc2_.graphics.lineTo(-15,140);
            }
            this.quests.push({
               "container":_loc2_,
               "type":_loc3_,
               "loc":_loc4_,
               "progress":_loc5_,
               "total":_loc6_,
               "time":0
            });
            _loc1_++;
         }
         this.§_-uH§ = 160;
      }
      
      private function §_-o2o§() : void
      {
         this.§_-82k§ = new DataProvider();
         var _loc1_:int = 0;
         while(_loc1_ < DATA.length)
         {
            this.§_-82k§.addItem({
               "label":DATA[_loc1_]["name"],
               "value":_loc1_
            });
            _loc1_++;
         }
         this.§_-ss§ = new DataProvider();
         _loc1_ = 0;
         while(_loc1_ < §_-51L§.length)
         {
            this.§_-ss§.addItem({
               "label":§_-Nr§[_loc1_],
               "value":§_-51L§[_loc1_]
            });
            _loc1_++;
         }
      }
      
      private function §_-AY§(param1:int) : int
      {
         return §_-51L§.indexOf(param1);
      }
      
      private function §_-41§(param1:int) : void
      {
         var _loc5_:int = 0;
         var _loc2_:Object = this.quests[param1];
         var _loc3_:int = (_loc2_["type"] as §_-h1x§).§_-Uf§;
         var _loc4_:int = (_loc2_["loc"] as §_-h1x§).§_-Uf§;
         if(_loc3_ >= 0 && _loc3_ < DATA.length && _loc4_ >= 0)
         {
            _loc5_ = int(DATA[_loc3_]["value"][param1][_loc4_]);
            _loc2_["total"].text = "/ " + _loc5_;
         }
      }
   }
}

