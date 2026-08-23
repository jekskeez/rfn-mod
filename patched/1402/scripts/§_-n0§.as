package
{
   import §_-X1k§.§_-LZ§;
   import §_-bN§.Dialog;
   import buttons.§_-K2G§;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import utils.§_-r1G§;
   import views.§_-81I§;
   
   public class §_-n0§ extends Sprite
   {
      
      private static const §_-a2d§:Number = 0.3;
      
      private static const §_-W2U§:TextFormat = new TextFormat(§_-i5§.§_-c10§,11,0,true);
      
      private static const §_-fC§:TextFormat = new TextFormat(§_-i5§.§_-c10§,11,0);
      
      private static const §_-p1z§:TextFormat = new TextFormat(§_-i5§.§_-c10§,11,16711680);
      
      private static const DATA:Array = [{
         "value":§_-at§.§_-V1H§,
         "title":gls("Редактор карт"),
         "clip":"LocationEditorPreview",
         "x":395,
         "y":95,
         "description":gls("Здесь ты сможешь создавать новые карты по своему вкусу.")
      },{
         "value":§_-at§.§_-I6§,
         "title":gls("Солнечные долины"),
         "clip":"LocationIslandsPreview",
         "x":175,
         "y":185,
         "description":gls("Солнечные долины, созданные внезапным катаклизмом - идеальное место для молодых белок. Теплая трава и горный снег - лучше не бывает!")
      },{
         "value":§_-at§.§_-D18§,
         "title":gls("Топи"),
         "clip":"LocationSwampPreview",
         "x":60,
         "y":185,
         "description":gls("Когда-то давно на месте чудесного леса образовалось труднопроходимое, скрывающее в себе опасности болото.")
      },{
         "value":§_-at§.§_-92b§,
         "title":gls("Пустыня"),
         "clip":"LocationDesertPreview",
         "x":360,
         "y":165,
         "description":gls("Только самые смелые белки отправляются в бескрайнюю Пустыню в долгое и рискованное путешествие на поиски сокровищ.")
      },{
         "value":§_-at§.§_-j1i§,
         "title":gls("Аномальная зона"),
         "clip":"LocationAnomalZonePreview",
         "x":270,
         "y":195,
         "description":gls("Волей злодейки-судьбы метеорит упал прямо на Спасательный шаттл. И на месте корабля образовалась Аномальная зона.")
      },{
         "value":§_-at§.§_-U1s§,
         "title":gls("Шторм"),
         "clip":"LocationStormPreview",
         "x":540,
         "y":200,
         "description":gls("В самом центре мира белок разбушевался Шторм. Леденящие душу опасности поджидают тебя здесь.")
      },{
         "value":§_-at§.§_-e2a§,
         "title":gls("Испытания"),
         "clip":"LocationHardPreview",
         "x":420,
         "y":185,
         "description":gls("Отряды самых смелых, умелых и тренированных белок направляются в Испытания, чтобы показать, на что они способны.")
      },{
         "value":§_-at§.§_-N2g§,
         "title":gls("Битва"),
         "clip":"LocationBattlePreview",
         "x":415,
         "y":220,
         "description":gls("Битва — постоянное место обитания настоящих белок-гладиаторов. Девиз участников битвы — «Победа или смерть!».")
      },{
         "value":§_-at§.§_-G1K§,
         "title":gls("Дикие земли"),
         "clip":"LocationWildLandsPreview",
         "x":310,
         "y":220,
         "description":gls("Тайна Диких земель долго оставалась не раскрытой. Чудовище бесследно исчезло, а маленькие пушистые храбрецы смогли войти в темные недра красных земель.")
      },{
         "value":§_-at§.§_-nq§,
         "title":gls("Стадион"),
         "clip":"LocationOlympicPreview",
         "x":285,
         "y":220,
         "description":gls("Место для олимпийских соревнований закрыто на реконструкцию, чтобы предстать перед белками в новом обличии.")
      },{
         "value":§_-at§.§_-Uf§,
         "title":gls("Школа"),
         "clip":"LocationShamanPreview",
         "x":210,
         "y":220,
         "description":gls("В школе юные белки проходят обучение магии и шаманству. Освоив магию, сможешь её использовать. Узнав секреты шамана, сможешь вести за собой бельчат.")
      }];
      
      private static var id:int = -1;
      
      private static var timer:Number = 0;
      
      private var data:Object = {};
      
      private var §_-BE§:Object = null;
      
      private var container:Sprite = null;
      
      private var §_-F2u§:int = -1;
      
      private var §_-N2m§:§_-i5§ = null;
      
      private var §_-iy§:§_-i5§ = null;
      
      private var §_-62N§:§_-i5§ = null;
      
      private var §_-g1r§:§_-i5§ = null;
      
      private var §_-kh§:§_-i5§ = null;
      
      private var §_-rg§:§_-K2G§ = null;
      
      private var §_-C2V§:Function = null;
      
      private var §_-n13§:Vector.<int> = null;
      
      private var §_-K1f§:Boolean = false;
      
      private var §_-s1J§:Sprite = new Sprite();
      
      private var §_-Xk§:§_-81I§ = null;
      
      public var blocked:Boolean = false;
      
      public function §_-n0§(param1:Object, param2:Sprite = null, param3:Function = null, param4:Vector.<int> = null)
      {
         super();
         this.§_-BE§ = param1;
         this.container = param2 || Game.§_-q1L§;
         this.visible = false;
         this.§_-C2V§ = param3;
         this.§_-n13§ = param4;
         this.§_-K1f§ = this.§_-C2V§ != null && this.§_-n13§ != null;
         this.init();
      }
      
      public static function location(param1:int) : Object
      {
         var _loc2_:Object = null;
         for each(_loc2_ in DATA)
         {
            if(_loc2_.value == param1)
            {
               return _loc2_;
            }
         }
         return DATA[0];
      }
      
      public function §_-y1W§(param1:Array) : void
      {
         var _loc2_:String = null;
         for(_loc2_ in this.data)
         {
            this.data[_loc2_]["online"] = (_loc2_ in param1 ? param1[_loc2_] : 0).toString();
         }
         if(this.visible)
         {
            this.§_-62N§.htmlText = §_-r1G§.span(this.data[_loc2_]["online"],"online");
         }
      }
      
      public function §_-w2J§() : void
      {
         this.§_-Xk§.§_-dq§();
      }
      
      public function §_-bH§(param1:Vector.<int>) : void
      {
         if(!this.§_-K1f§)
         {
            return;
         }
         this.§_-n13§ = param1;
         if(this.visible)
         {
            this.§_-z2Q§();
         }
      }
      
      private function init() : void
      {
         var _loc1_:Object = null;
         var _loc2_:MovieClip = null;
         var _loc3_:DisplayObject = null;
         for each(_loc1_ in DATA)
         {
            this.data[_loc1_["value"]] = _loc1_;
         }
         for each(_loc2_ in this.§_-BE§)
         {
            if(this.§_-K1f§)
            {
               _loc2_.addEventListener(MouseEvent.CLICK,this.§_-E2Z§,false,0,true);
            }
            else
            {
               _loc2_.addEventListener(MouseEvent.MOUSE_OVER,this.§_-O1s§);
               _loc2_.addEventListener(MouseEvent.MOUSE_UP,this.§_-O1s§);
               _loc2_.addEventListener(MouseEvent.MOUSE_OUT,this.close);
            }
            _loc2_.addEventListener(Event.REMOVED_FROM_STAGE,this.§_-jF§);
         }
         _loc3_ = new DialogBaseBackground();
         _loc3_.width = 345;
         _loc3_.height = this.§_-K1f§ ? 320 : 310;
         _loc3_.filters = [Dialog.§_-92m§];
         addChild(_loc3_);
         this.§_-Xk§ = new §_-81I§();
         this.§_-Xk§.x = 15;
         this.§_-Xk§.y = 40;
         addChild(this.§_-Xk§);
         this.§_-N2m§ = new §_-i5§("",0,7,Dialog.FORMAT_CAPTION_18_CENTER);
         this.§_-N2m§.filters = Dialog.§_-q2I§;
         this.§_-N2m§.width = _loc3_.width;
         this.§_-N2m§.multiline = true;
         this.§_-N2m§.wordWrap = true;
         addChild(this.§_-N2m§);
         this.§_-iy§ = new §_-i5§("",15,200,new TextFormat(§_-i5§.§_-c10§,14,0,false,null,null,null,null,"center"));
         this.§_-iy§.width = _loc3_.width - 30;
         this.§_-iy§.multiline = true;
         this.§_-iy§.wordWrap = true;
         addChild(this.§_-iy§);
         this.§_-s1J§.addChild(new §_-i5§(gls("Онлайн:"),15,280,§_-W2U§));
         this.§_-62N§ = new §_-i5§("0",70,280,§_-fC§);
         this.§_-s1J§.addChild(this.§_-62N§);
         this.§_-s1J§.addChild(new §_-i5§(gls("Требуется:"),120,280,§_-W2U§));
         this.§_-g1r§ = new §_-i5§("",190,280,§_-fC§);
         this.§_-s1J§.addChild(this.§_-g1r§);
         var _loc4_:DisplayObject = new ImageIconEnergy();
         _loc4_.scaleX = _loc4_.scaleY = 0.6;
         _loc4_.x = 210;
         _loc4_.y = 280;
         this.§_-s1J§.addChild(_loc4_);
         this.§_-kh§ = new §_-i5§("",240,280,§_-fC§);
         this.§_-s1J§.addChild(this.§_-kh§);
         if(this.§_-K1f§)
         {
            this.§_-rg§ = new §_-K2G§(gls("Играть"),95,18,this.§_-y1Q§);
            this.§_-rg§.x = 235;
            this.§_-rg§.y = 274;
            this.§_-s1J§.addChild(this.§_-rg§);
         }
         this.§_-s1J§.graphics.beginFill(16777215,1);
         this.§_-s1J§.graphics.drawRoundRect(68,280,40,16,5,5);
         this.§_-s1J§.graphics.drawRoundRect(188,280,35,16,5,5);
         addChild(this.§_-s1J§);
         §_-p1V§.§_-A3z§(this.§_-t29§);
      }
      
      private function §_-O1s§(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         if(this.blocked)
         {
            return;
         }
         id = -1;
         for(_loc2_ in this.§_-BE§)
         {
            if(_loc2_ in this.data)
            {
               if(this.§_-BE§[_loc2_] == param1.currentTarget)
               {
                  id = int(_loc2_);
                  break;
               }
            }
         }
         if(id == -1)
         {
            return;
         }
         this.§_-1S§(false);
         if(this.visible && id == this.§_-F2u§)
         {
            return;
         }
         this.x = this.data[this.§_-F2u§]["x"];
         this.y = this.data[this.§_-F2u§]["y"];
         if(param1.type == MouseEvent.MOUSE_UP && this.container.contains(this))
         {
            this.container.removeChild(this);
         }
         if(this.container.contains(this))
         {
            return;
         }
         this.container.addChild(this);
      }
      
      private function §_-E2Z§(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         if(this.blocked)
         {
            return;
         }
         param1.stopPropagation();
         id = -1;
         for(_loc2_ in this.§_-BE§)
         {
            if(_loc2_ in this.data)
            {
               if(this.§_-BE§[_loc2_] == param1.currentTarget)
               {
                  id = int(_loc2_);
                  break;
               }
            }
         }
         if(id == -1)
         {
            return;
         }
         this.§_-1S§(true);
         this.x = this.data[this.§_-F2u§]["x"];
         this.y = this.data[this.§_-F2u§]["y"];
         if(!this.container.contains(this))
         {
            this.container.addChild(this);
         }
         this.visible = true;
         timer = §_-a2d§;
         this.§_-yN§();
      }
      
      private function §_-y1Q§(param1:Event = null) : void
      {
         var _loc2_:int = this.§_-F2u§;
         if(this.§_-C2V§ == null || _loc2_ < 0)
         {
            return;
         }
         if(this.§_-n13§ == null || this.§_-n13§.indexOf(_loc2_) == -1)
         {
            return;
         }
         this.§_-C2V§(_loc2_);
         this.close();
      }
      
      private function §_-yN§() : void
      {
         this.§_-K1h§();
         if(!this.§_-K1f§ || Game.stage == null)
         {
            return;
         }
         Game.stage.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-um§,false,0,true);
      }
      
      private function §_-K1h§() : void
      {
         if(Game.stage == null)
         {
            return;
         }
         Game.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-um§,false);
      }
      
      private function §_-um§(param1:MouseEvent) : void
      {
         if(!this.visible)
         {
            return;
         }
         var _loc2_:DisplayObject = param1.target as DisplayObject;
         if(_loc2_ != null && this.§_-wk§(_loc2_))
         {
            return;
         }
         this.close();
      }
      
      private function §_-wk§(param1:DisplayObject) : Boolean
      {
         var _loc3_:MovieClip = null;
         var _loc2_:DisplayObject = param1;
         while(_loc2_ != null)
         {
            if(_loc2_ == this)
            {
               return true;
            }
            for each(_loc3_ in this.§_-BE§)
            {
               if(_loc3_ != null)
               {
                  if(_loc2_ == _loc3_ || _loc3_ is DisplayObjectContainer && (_loc3_ as DisplayObjectContainer).contains(_loc2_))
                  {
                     return true;
                  }
               }
            }
            _loc2_ = _loc2_.parent;
         }
         return false;
      }
      
      private function §_-z2Q§() : void
      {
         if(this.§_-rg§ == null || this.§_-n13§ == null)
         {
            return;
         }
         var _loc1_:int = this.§_-F2u§;
         this.§_-rg§.enabled = _loc1_ >= 0 && this.§_-n13§.indexOf(_loc1_) != -1;
      }
      
      private function §_-1S§(param1:Boolean = false) : void
      {
         this.§_-Xk§.§_-Hk§ = this.data[id]["clip"];
         if(!param1 && this.§_-F2u§ == id)
         {
            return;
         }
         this.§_-F2u§ = id;
         var _loc2_:Location = §_-at§.§_-13l§(id);
         var _loc3_:Array = [§_-at§.§_-Uf§,§_-at§.§_-nq§,§_-at§.§_-V1H§];
         var _loc4_:Boolean = _loc3_.indexOf(id) == -1;
         this.§_-N2m§.text = this.data[id]["title"];
         this.§_-iy§.text = this.data[id]["description"];
         this.§_-62N§.text = _loc4_ ? this.data[id]["online"] : "-";
         this.§_-g1r§.text = _loc4_ ? String(_loc2_.cost) : "-";
         this.§_-kh§.text = _loc2_.level == 0 ? gls("Доступно всем") : (_loc2_.id == §_-at§.§_-nq§ ? gls("В разработке") : gls("С {0} уровня",_loc2_.level));
         this.§_-kh§.setTextFormat(_loc2_.level > §_-LZ§.§_-mA§ || _loc2_.id == §_-at§.§_-nq§ ? §_-p1z§ : §_-fC§);
         if(this.§_-K1f§)
         {
            this.§_-z2Q§();
            this.§_-kh§.x = this.§_-rg§.x + (this.§_-rg§.width - this.§_-kh§.width) * 0.5;
            this.§_-kh§.y = this.§_-rg§.y + this.§_-rg§.height;
         }
      }
      
      private function §_-jF§(param1:Event) : void
      {
         timer = 0;
         id = -1;
         if(!this.visible)
         {
            return;
         }
         this.close();
      }
      
      private function close(param1:MouseEvent = null) : void
      {
         timer = 0;
         id = -1;
         this.§_-K1h§();
         this.visible = false;
         if(!this.container.contains(this))
         {
            return;
         }
         this.container.removeChild(this);
      }
      
      private function §_-t29§() : void
      {
         if(id == -1)
         {
            return;
         }
         if(timer >= §_-a2d§)
         {
            return;
         }
         timer += §_-p1V§.delay;
         if(timer >= §_-a2d§)
         {
            this.visible = true;
         }
      }
   }
}

