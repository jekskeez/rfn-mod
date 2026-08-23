package §_-Al§
{
   import §_-B1G§.§_-32t§;
   import §_-E1v§.§_-A3G§;
   import §_-E1v§.§_-j1d§;
   import §_-E1v§.§_-y1B§;
   import fl.data.DataProvider;
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.utils.Endian;
   import protocol.§_-z1i§;
   
   public class §_-V27§ extends §_-K1K§
   {
      
      private static const §_-L2w§:int = 2;
      
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
      
      private static const §_-c2f§:Array = [§_-at§.§_-I6§,§_-at§.§_-vr§,§_-at§.§_-D18§,§_-at§.§_-92b§,§_-at§.§_-U1s§,§_-at§.§_-j1i§];
      
      private static const §_-zj§:Array = ["Солнечные долины","Снежные хребты","Топи","Пустыня","Шторм","Аномальная зона"];
      
      private var quests:Array = [];
      
      private var §_-F25§:DataProvider = null;
      
      private var §_-oT§:DataProvider = null;
      
      public function §_-V27§()
      {
         super(§_-K1K§.§_-pY§);
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
         while(_loc2_ < §_-L2w§)
         {
            _loc3_ = this.quests[_loc2_];
            _loc3_["container"].visible = false;
            if(param1.length > _loc2_ * 4)
            {
               _loc4_ = int(param1[_loc2_ * 4]);
               if(_loc4_ < DATA.length)
               {
                  _loc3_["container"].visible = true;
                  (_loc3_["type"] as §_-32t§).§_-JZ§ = _loc4_;
                  (_loc3_["loc"] as §_-32t§).§_-JZ§ = this.§_-U2U§(param1[_loc2_ * 4 + 1]);
                  _loc3_["progress"].text = param1[_loc2_ * 4 + 2].toString();
                  _loc3_["time"] = param1[_loc2_ * 4 + 3];
                  this.§_-FB§(_loc2_);
               }
            }
            _loc2_++;
         }
      }
      
      override public function save() : §_-z1i§
      {
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc1_:§_-z1i§ = new §_-z1i§();
         _loc1_.endian = Endian.LITTLE_ENDIAN;
         _loc1_.§_-C1W§(§_-L2w§ * 4);
         var _loc2_:int = 0;
         while(_loc2_ < §_-L2w§)
         {
            _loc3_ = this.quests[_loc2_];
            if(_loc3_["container"].visible)
            {
               _loc4_ = int((_loc3_["type"] as §_-32t§).§_-E2v§["value"]);
               _loc5_ = int((_loc3_["loc"] as §_-32t§).§_-E2v§["value"]);
               _loc6_ = int(_loc3_["progress"].text);
               _loc7_ = int(_loc3_["time"]);
               _loc1_.§_-C1W§(_loc4_);
               _loc1_.§_-C1W§(_loc5_);
               _loc1_.§_-C1W§(_loc6_);
               _loc1_.§_-C1W§(_loc7_);
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      override protected function §_-c1v§() : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:§_-32t§ = null;
         var _loc4_:§_-32t§ = null;
         var _loc5_:TextField = null;
         var _loc6_:§_-y1B§ = null;
         this.§_-g2X§();
         var _loc1_:int = 0;
         while(_loc1_ < §_-L2w§)
         {
            _loc2_ = new Sprite();
            _loc2_.x = _loc1_ * 220;
            this.§_-2H§.addChild(_loc2_);
            _loc2_.addChild(new §_-y1B§("Тип:",0,0,§_-A3G§.§_-v1I§));
            _loc3_ = new §_-32t§(200);
            _loc3_.§_-GO§ = this.§_-F25§;
            _loc3_.x = 0;
            _loc3_.y = 20;
            _loc2_.addChild(_loc3_);
            _loc2_.addChild(new §_-y1B§("Локация:",0,60,§_-A3G§.§_-v1I§));
            _loc4_ = new §_-32t§(200);
            _loc4_.§_-GO§ = this.§_-oT§;
            _loc4_.x = 0;
            _loc4_.y = 80;
            _loc2_.addChild(_loc4_);
            _loc2_.addChild(new §_-y1B§("Прогресс:",0,120,§_-A3G§.§_-v1I§));
            _loc5_ = new TextField();
            §_-j1d§.§_-43I§(_loc5_,_loc2_,60,120,50,18,10,true);
            _loc6_ = new §_-y1B§("",115,120,§_-A3G§.§_-v1I§);
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
         this.§_-J1E§ = 160;
      }
      
      private function §_-g2X§() : void
      {
         this.§_-F25§ = new DataProvider();
         var _loc1_:int = 0;
         while(_loc1_ < DATA.length)
         {
            this.§_-F25§.addItem({
               "label":DATA[_loc1_]["name"],
               "value":_loc1_
            });
            _loc1_++;
         }
         this.§_-oT§ = new DataProvider();
         _loc1_ = 0;
         while(_loc1_ < §_-c2f§.length)
         {
            this.§_-oT§.addItem({
               "label":§_-zj§[_loc1_],
               "value":§_-c2f§[_loc1_]
            });
            _loc1_++;
         }
      }
      
      private function §_-U2U§(param1:int) : int
      {
         return §_-c2f§.indexOf(param1);
      }
      
      private function §_-FB§(param1:int) : void
      {
         var _loc5_:int = 0;
         var _loc2_:Object = this.quests[param1];
         var _loc3_:int = (_loc2_["type"] as §_-32t§).§_-JZ§;
         var _loc4_:int = (_loc2_["loc"] as §_-32t§).§_-JZ§;
         if(_loc3_ >= 0 && _loc3_ < DATA.length && _loc4_ >= 0)
         {
            _loc5_ = int(DATA[_loc3_]["value"][param1][_loc4_]);
            _loc2_["total"].text = "/ " + _loc5_;
         }
      }
   }
}

