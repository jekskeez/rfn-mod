package
{
   import §_-I10§.§_-d2x§;
   import §_-k1c§.Dialog;
   import buttons.§_-j18§;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import utils.§_-xb§;
   import views.§_-r1q§;
   
   public class §_-31K§ extends Sprite
   {
      
      private static const §_-s1W§:Number = 0.3;
      
      private static const §_-a1Y§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,11,0,true);
      
      private static const §_-5i§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,11,0);
      
      private static const §_-p2b§:TextFormat = new TextFormat(§_-22V§.§_-F2z§,11,16711680);
      
      private static const DATA:Array = [{
         "value":§_-q1p§.§_-2Z§,
         "title":gls("Редактор карт"),
         "clip":"LocationEditorPreview",
         "x":395,
         "y":95,
         "description":gls("Здесь ты сможешь создавать новые карты по своему вкусу.")
      },{
         "value":§_-q1p§.§_-C25§,
         "title":gls("Солнечные долины"),
         "clip":"LocationIslandsPreview",
         "x":175,
         "y":185,
         "description":gls("Солнечные долины, созданные внезапным катаклизмом - идеальное место для молодых белок. Теплая трава и горный снег - лучше не бывает!")
      },{
         "value":§_-q1p§.§_-sL§,
         "title":gls("Топи"),
         "clip":"LocationSwampPreview",
         "x":60,
         "y":185,
         "description":gls("Когда-то давно на месте чудесного леса образовалось труднопроходимое, скрывающее в себе опасности болото.")
      },{
         "value":§_-q1p§.§_-P4§,
         "title":gls("Пустыня"),
         "clip":"LocationDesertPreview",
         "x":360,
         "y":165,
         "description":gls("Только самые смелые белки отправляются в бескрайнюю Пустыню в долгое и рискованное путешествие на поиски сокровищ.")
      },{
         "value":§_-q1p§.§_-u2u§,
         "title":gls("Аномальная зона"),
         "clip":"LocationAnomalZonePreview",
         "x":270,
         "y":195,
         "description":gls("Волей злодейки-судьбы метеорит упал прямо на Спасательный шаттл. И на месте корабля образовалась Аномальная зона.")
      },{
         "value":§_-q1p§.§_-Q1s§,
         "title":gls("Шторм"),
         "clip":"LocationStormPreview",
         "x":540,
         "y":200,
         "description":gls("В самом центре мира белок разбушевался Шторм. Леденящие душу опасности поджидают тебя здесь.")
      },{
         "value":§_-q1p§.§_-A3z§,
         "title":gls("Испытания"),
         "clip":"LocationHardPreview",
         "x":420,
         "y":185,
         "description":gls("Отряды самых смелых, умелых и тренированных белок направляются в Испытания, чтобы показать, на что они способны.")
      },{
         "value":§_-q1p§.§_-M1m§,
         "title":gls("Битва"),
         "clip":"LocationBattlePreview",
         "x":415,
         "y":220,
         "description":gls("Битва — постоянное место обитания настоящих белок-гладиаторов. Девиз участников битвы — «Победа или смерть!».")
      },{
         "value":§_-q1p§.§_-k2B§,
         "title":gls("Дикие земли"),
         "clip":"LocationWildLandsPreview",
         "x":310,
         "y":220,
         "description":gls("Тайна Диких земель долго оставалась не раскрытой. Чудовище бесследно исчезло, а маленькие пушистые храбрецы смогли войти в темные недра красных земель.")
      },{
         "value":§_-q1p§.§_-427§,
         "title":gls("Стадион"),
         "clip":"LocationOlympicPreview",
         "x":285,
         "y":220,
         "description":gls("Место для олимпийских соревнований закрыто на реконструкцию, чтобы предстать перед белками в новом обличии.")
      },{
         "value":§_-q1p§.§_-G1z§,
         "title":gls("Школа"),
         "clip":"LocationShamanPreview",
         "x":210,
         "y":220,
         "description":gls("В школе юные белки проходят обучение магии и шаманству. Освоив магию, сможешь её использовать. Узнав секреты шамана, сможешь вести за собой бельчат.")
      }];
      
      private static var id:int = -1;
      
      private static var timer:Number = 0;
      
      private var data:Object = {};
      
      private var §_-fI§:Object = null;
      
      private var container:Sprite = null;
      
      private var §_-Vz§:int = -1;
      
      private var §_-Uk§:§_-22V§ = null;
      
      private var §_-M2q§:§_-22V§ = null;
      
      private var §_-N2J§:§_-22V§ = null;
      
      private var §_-B2Z§:§_-22V§ = null;
      
      private var §_-h1I§:§_-22V§ = null;
      
      private var §_-921§:§_-j18§ = null;
      
      private var §_-332§:Function = null;
      
      private var §_-e1e§:Vector.<int> = null;
      
      private var §_-kP§:Boolean = false;
      
      private var §_-63n§:Sprite = new Sprite();
      
      private var §_-52W§:§_-r1q§ = null;
      
      public var blocked:Boolean = false;
      
      public function §_-31K§(param1:Object, param2:Sprite = null, param3:Function = null, param4:Vector.<int> = null)
      {
         super();
         this.§_-fI§ = param1;
         this.container = param2 || Game.§_-d2t§;
         this.visible = false;
         this.§_-332§ = param3;
         this.§_-e1e§ = param4;
         this.§_-kP§ = this.§_-332§ != null && this.§_-e1e§ != null;
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
      
      public function §_-4K§(param1:Array) : void
      {
         var _loc2_:String = null;
         for(_loc2_ in this.data)
         {
            this.data[_loc2_]["online"] = (_loc2_ in param1 ? param1[_loc2_] : 0).toString();
         }
         if(this.visible)
         {
            this.§_-N2J§.htmlText = §_-xb§.span(this.data[_loc2_]["online"],"online");
         }
      }
      
      public function §_-B1T§() : void
      {
         this.§_-52W§.§_-d2v§();
      }
      
      public function §_-65§(param1:Vector.<int>) : void
      {
         if(!this.§_-kP§)
         {
            return;
         }
         this.§_-e1e§ = param1;
         if(this.visible)
         {
            this.§_-99§();
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
         for each(_loc2_ in this.§_-fI§)
         {
            if(this.§_-kP§)
            {
               _loc2_.addEventListener(MouseEvent.CLICK,this.§_-k2Y§,false,0,true);
            }
            else
            {
               _loc2_.addEventListener(MouseEvent.MOUSE_OVER,this.§_-027§);
               _loc2_.addEventListener(MouseEvent.MOUSE_UP,this.§_-027§);
               _loc2_.addEventListener(MouseEvent.MOUSE_OUT,this.close);
            }
            _loc2_.addEventListener(Event.REMOVED_FROM_STAGE,this.§_-q1v§);
         }
         _loc3_ = new DialogBaseBackground();
         _loc3_.width = 345;
         _loc3_.height = this.§_-kP§ ? 320 : 310;
         _loc3_.filters = [Dialog.§_-X1h§];
         addChild(_loc3_);
         this.§_-52W§ = new §_-r1q§();
         this.§_-52W§.x = 15;
         this.§_-52W§.y = 40;
         addChild(this.§_-52W§);
         this.§_-Uk§ = new §_-22V§("",0,7,Dialog.FORMAT_CAPTION_18_CENTER);
         this.§_-Uk§.filters = Dialog.§_-m2A§;
         this.§_-Uk§.width = _loc3_.width;
         this.§_-Uk§.multiline = true;
         this.§_-Uk§.wordWrap = true;
         addChild(this.§_-Uk§);
         this.§_-M2q§ = new §_-22V§("",15,200,new TextFormat(§_-22V§.§_-F2z§,14,0,false,null,null,null,null,"center"));
         this.§_-M2q§.width = _loc3_.width - 30;
         this.§_-M2q§.multiline = true;
         this.§_-M2q§.wordWrap = true;
         addChild(this.§_-M2q§);
         this.§_-63n§.addChild(new §_-22V§(gls("Онлайн:"),15,280,§_-a1Y§));
         this.§_-N2J§ = new §_-22V§("0",70,280,§_-5i§);
         this.§_-63n§.addChild(this.§_-N2J§);
         this.§_-63n§.addChild(new §_-22V§(gls("Требуется:"),120,280,§_-a1Y§));
         this.§_-B2Z§ = new §_-22V§("",190,280,§_-5i§);
         this.§_-63n§.addChild(this.§_-B2Z§);
         var _loc4_:DisplayObject = new ImageIconEnergy();
         _loc4_.scaleX = _loc4_.scaleY = 0.6;
         _loc4_.x = 210;
         _loc4_.y = 280;
         this.§_-63n§.addChild(_loc4_);
         this.§_-h1I§ = new §_-22V§("",240,280,§_-5i§);
         this.§_-63n§.addChild(this.§_-h1I§);
         if(this.§_-kP§)
         {
            this.§_-921§ = new §_-j18§(gls("Играть"),95,18,this.§_-n2w§);
            this.§_-921§.x = 235;
            this.§_-921§.y = 274;
            this.§_-63n§.addChild(this.§_-921§);
         }
         this.§_-63n§.graphics.beginFill(16777215,1);
         this.§_-63n§.graphics.drawRoundRect(68,280,40,16,5,5);
         this.§_-63n§.graphics.drawRoundRect(188,280,35,16,5,5);
         addChild(this.§_-63n§);
         §_-01Y§.§_-h1R§(this.§_-H5§);
      }
      
      private function §_-027§(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         if(this.blocked)
         {
            return;
         }
         id = -1;
         for(_loc2_ in this.§_-fI§)
         {
            if(_loc2_ in this.data)
            {
               if(this.§_-fI§[_loc2_] == param1.currentTarget)
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
         this.§_-h1E§(false);
         if(this.visible && id == this.§_-Vz§)
         {
            return;
         }
         this.x = this.data[this.§_-Vz§]["x"];
         this.y = this.data[this.§_-Vz§]["y"];
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
      
      private function §_-k2Y§(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         if(this.blocked)
         {
            return;
         }
         param1.stopPropagation();
         id = -1;
         for(_loc2_ in this.§_-fI§)
         {
            if(_loc2_ in this.data)
            {
               if(this.§_-fI§[_loc2_] == param1.currentTarget)
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
         this.§_-h1E§(true);
         this.x = this.data[this.§_-Vz§]["x"];
         this.y = this.data[this.§_-Vz§]["y"];
         if(!this.container.contains(this))
         {
            this.container.addChild(this);
         }
         this.visible = true;
         timer = §_-s1W§;
         this.§_-R1O§();
      }
      
      private function §_-n2w§(param1:Event = null) : void
      {
         var _loc2_:int = this.§_-Vz§;
         if(this.§_-332§ == null || _loc2_ < 0)
         {
            return;
         }
         if(this.§_-e1e§ == null || this.§_-e1e§.indexOf(_loc2_) == -1)
         {
            return;
         }
         this.§_-332§(_loc2_);
         this.close();
      }
      
      private function §_-R1O§() : void
      {
         this.§_-A1y§();
         if(!this.§_-kP§ || Game.stage == null)
         {
            return;
         }
         Game.stage.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-Kt§,false,0,true);
      }
      
      private function §_-A1y§() : void
      {
         if(Game.stage == null)
         {
            return;
         }
         Game.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-Kt§,false);
      }
      
      private function §_-Kt§(param1:MouseEvent) : void
      {
         if(!this.visible)
         {
            return;
         }
         var _loc2_:DisplayObject = param1.target as DisplayObject;
         if(_loc2_ != null && this.§_-Xa§(_loc2_))
         {
            return;
         }
         this.close();
      }
      
      private function §_-Xa§(param1:DisplayObject) : Boolean
      {
         var _loc3_:MovieClip = null;
         var _loc2_:DisplayObject = param1;
         while(_loc2_ != null)
         {
            if(_loc2_ == this)
            {
               return true;
            }
            for each(_loc3_ in this.§_-fI§)
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
      
      private function §_-99§() : void
      {
         if(this.§_-921§ == null || this.§_-e1e§ == null)
         {
            return;
         }
         var _loc1_:int = this.§_-Vz§;
         this.§_-921§.enabled = _loc1_ >= 0 && this.§_-e1e§.indexOf(_loc1_) != -1;
      }
      
      private function §_-h1E§(param1:Boolean = false) : void
      {
         this.§_-52W§.§_-L2B§ = this.data[id]["clip"];
         if(!param1 && this.§_-Vz§ == id)
         {
            return;
         }
         this.§_-Vz§ = id;
         var _loc2_:Location = §_-q1p§.§_-l29§(id);
         var _loc3_:Array = [§_-q1p§.§_-G1z§,§_-q1p§.§_-427§,§_-q1p§.§_-2Z§];
         var _loc4_:Boolean = _loc3_.indexOf(id) == -1;
         this.§_-Uk§.text = this.data[id]["title"];
         this.§_-M2q§.text = this.data[id]["description"];
         this.§_-N2J§.text = _loc4_ ? this.data[id]["online"] : "-";
         this.§_-B2Z§.text = _loc4_ ? String(_loc2_.cost) : "-";
         this.§_-h1I§.text = _loc2_.level == 0 ? gls("Доступно всем") : (_loc2_.id == §_-q1p§.§_-427§ ? gls("В разработке") : gls("С {0} уровня",_loc2_.level));
         this.§_-h1I§.setTextFormat(_loc2_.level > §_-d2x§.§_-z2o§ || _loc2_.id == §_-q1p§.§_-427§ ? §_-p2b§ : §_-5i§);
         if(this.§_-kP§)
         {
            this.§_-99§();
            this.§_-h1I§.x = this.§_-921§.x + (this.§_-921§.width - this.§_-h1I§.width) * 0.5;
            this.§_-h1I§.y = this.§_-921§.y + this.§_-921§.height;
         }
      }
      
      private function §_-q1v§(param1:Event) : void
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
         this.§_-A1y§();
         this.visible = false;
         if(!this.container.contains(this))
         {
            return;
         }
         this.container.removeChild(this);
      }
      
      private function §_-H5§() : void
      {
         if(id == -1)
         {
            return;
         }
         if(timer >= §_-s1W§)
         {
            return;
         }
         timer += §_-01Y§.delay;
         if(timer >= §_-s1W§)
         {
            this.visible = true;
         }
      }
   }
}

