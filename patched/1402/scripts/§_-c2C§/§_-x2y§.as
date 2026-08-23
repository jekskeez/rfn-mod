package §_-c2C§
{
   import §_-J19§.§_-534§;
   import §_-J21§.§_-M1l§;
   import §_-J21§.§_-Q1j§;
   import §_-S1n§.§_-f0§;
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-I2l§;
   import §_-X1k§.§_-L1o§;
   import §_-X1k§.§_-P2x§;
   import §_-a11§.§_-h2m§;
   import §_-s2e§.§_-U2d§;
   import §_-z2V§.WardrobeOutfitSkinsPanel;
   import §_-z2V§.§_-22q§;
   import §_-z2V§.§_-L21§;
   import §_-z2V§.§_-dM§;
   import §_-z2V§.§_-hu§;
   import buttons.§_-Hg§;
   import buttons.§_-K2G§;
   import buttons.§_-Q1W§;
   import buttons.§_-Z2B§;
   import buttons.§_-uH§;
   import events.GameEvent;
   import events.§_-b2G§;
   import flash.display.BitmapData;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.geom.Matrix;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import tape.§_-2n§;
   import tape.§_-L2v§;
   import tape.§_-h2f§;
   import tape.§_-o2N§;
   import utils.§_-r1G§;
   import views.§_-53g§;
   import views.§_-918§;
   import views.§_-O1p§;
   import views.§_-o1H§;
   
   public class §_-x2y§ extends Screen
   {
      
      private static var _instance:§_-x2y§;
      
      public static const §_-D12§:Array = [new TextFormat(§_-i5§.§_-p1s§,18,8746579),new TextFormat(§_-i5§.§_-p1s§,18,8746579),new TextFormat(§_-i5§.§_-p1s§,18,8746579)];
      
      public static const §_-D1O§:Array = [new TextFormat(§_-i5§.§_-p1s§,12,16777215),new TextFormat(§_-i5§.§_-p1s§,12,16765761),new TextFormat(§_-i5§.§_-p1s§,12,16765761)];
      
      private static var §_-D1h§:int = -1;
      
      private static var §_-13z§:int = -1;
      
      private static var §_-41F§:Object = {};
      
      private static var types:Array = null;
      
      private static var §_-FJ§:Object = {};
      
      private static var §_-S2§:int = 223;
      
      private static var §_-S2i§:Boolean = false;
      
      public var hero:§_-o1H§ = null;
      
      private var §_-u21§:Boolean = false;
      
      private var §_-Z6§:§_-53g§;
      
      private var §_-K2K§:Sprite;
      
      private var §_-X1o§:Sprite;
      
      private var §_-KC§:int = §_-P2x§.§_-V1n§;
      
      private var §_-b2Q§:§_-Hg§ = null;
      
      private var §_-K2B§:§_-uH§ = null;
      
      private var §_-Bu§:§_-uH§ = null;
      
      private var §_-8U§:Vector.<§_-uH§> = new Vector.<§_-uH§>(0);
      
      private var §_-f2s§:§_-22q§ = null;
      
      private var §_-c1§:§_-22q§ = null;
      
      private var §_-t15§:WardrobeOutfitSkinsPanel = null;
      
      private var §_-82C§:Vector.<§_-L21§> = new Vector.<§_-L21§>(0);
      
      private var §_-C23§:§_-L2v§ = null;
      
      private var §_-y6§:SimpleButton = null;
      
      private var §_-u2Z§:SimpleButton = null;
      
      private var §_-Ej§:§_-O1p§ = null;
      
      private var §_-Y1K§:§_-K2G§ = null;
      
      private var §_-M2G§:§_-K2G§ = null;
      
      private var buttonBuy:§_-K2G§ = null;
      
      private var §_-q1c§:SimpleButton = null;
      
      private var §_-Y1T§:§_-i5§ = null;
      
      private var §_-314§:§_-f0§ = null;
      
      private var §_-Ja§:§_-918§ = null;
      
      public function §_-x2y§()
      {
         _instance = this;
         super();
         §_-L1o§.addEventListener(GameEvent.CLOTHES_HERO_CHANGE,this.§_-Q11§);
         §_-L1o§.addEventListener(GameEvent.CLOTHES_STORAGE_CHANGE,this.update);
         §_-L1o§.addEventListener(GameEvent.CLOTHES_STORAGE_CHANGE,this.§_-T13§);
      }
      
      public static function get instance() : §_-x2y§
      {
         return _instance;
      }
      
      public static function §_-R2f§(param1:int, param2:int) : void
      {
         if(!_instance || !_instance.§_-u21§)
         {
            return;
         }
         _instance.§_-R2f§(param1,param2);
      }
      
      override public function show() : void
      {
         super.show();
         if(!this.§_-u21§)
         {
            this.init();
            this.§_-u21§ = true;
            this.update();
            this.§_-T13§();
            this.§_-rh§(§_-L1o§.§_-m2I§);
            this.hero.§_-VM§(§_-L1o§.§_-m2I§,§_-L1o§.§_-ig§);
            this.§_-f2s§.§_-t19§();
            this.§_-c1§.§_-t19§();
            this.§_-y6§.visible = false;
         }
      }
      
      override public function hide() : void
      {
         super.hide();
         §_-51A§.§_-Q11§();
      }
      
      public function get §_-Z1H§() : int
      {
         return this.§_-KC§;
      }
      
      private function §_-V21§() : §_-22q§
      {
         return this.§_-KC§ == §_-P2x§.§_-qQ§ ? this.§_-c1§ : this.§_-f2s§;
      }
      
      private function §_-rh§(param1:Array, param2:int = -1) : void
      {
         if(param2 == -1)
         {
            param2 = this.§_-KC§;
         }
         this.hero.shaman = param2 == §_-P2x§.§_-qQ§;
         this.hero.view = this.hero.shaman ? §_-P2x§.§_-o2O§ : §_-P2x§.§_-81H§(param1);
      }
      
      private function init() : void
      {
         var _loc8_:§_-L21§ = null;
         var _loc9_:§_-uH§ = null;
         this.§_-Z6§ = new §_-53g§(Game.self["interior"],true);
         addChild(this.§_-Z6§);
         §_-I2l§.addEventListener(GameEvent.INTERIOR_CHANGE,this.§_-U1J§);
         this.§_-K2K§ = new Sprite();
         addChild(this.§_-K2K§);
         this.§_-K2K§.addChild(new ScreenWardrobeBackground());
         var _loc1_:§_-Z2B§ = new §_-Z2B§(false);
         _loc1_.x = 595;
         _loc1_.y = 385;
         this.§_-K2K§.addChild(_loc1_);
         var _loc2_:§_-i5§ = new §_-i5§(gls("Магия"),70,149,new TextFormat(§_-i5§.§_-p1s§,20,16773053,null,null,null,null,null,"center"),170);
         _loc2_.filters = [new GlowFilter(4134672,1,4,4,8),new DropShadowFilter(2,45,0,1,2,2,0.25)];
         this.§_-K2K§.addChild(_loc2_);
         _loc2_ = new §_-i5§(gls("Аксессуары"),665,149,new TextFormat(§_-i5§.§_-p1s§,20,16773053,null,null,null,null,null,"center"),170);
         _loc2_.filters = [new GlowFilter(4134672,1,4,4,8),new DropShadowFilter(2,45,0,1,2,2,0.25)];
         this.§_-K2K§.addChild(_loc2_);
         this.§_-Y1T§ = new §_-i5§("",300,146,new TextFormat(§_-i5§.§_-p1s§,20,16773053,null,null,null,null,null,"center"),300);
         this.§_-Y1T§.filters = [new GlowFilter(4134672,1,4,4,8),new DropShadowFilter(2,45,0,1,2,2,0.25)];
         this.§_-K2K§.addChild(this.§_-Y1T§);
         this.§_-314§ = new §_-f0§(this.§_-Y1T§,"");
         this.§_-Y1K§ = new §_-K2G§(gls("Надеть"),80);
         this.§_-Y1K§.x = 410;
         this.§_-Y1K§.y = 180;
         this.§_-Y1K§.visible = false;
         this.§_-Y1K§.addEventListener(MouseEvent.CLICK,this.§_-ge§);
         this.§_-Y1K§.§_-lT§();
         this.§_-K2K§.addChild(this.§_-Y1K§);
         this.§_-M2G§ = new §_-K2G§(gls("Снять"),80);
         this.§_-M2G§.x = 410;
         this.§_-M2G§.y = 180;
         this.§_-M2G§.visible = false;
         this.§_-M2G§.addEventListener(MouseEvent.CLICK,this.§_-ge§);
         this.§_-M2G§.§_-I29§();
         this.§_-K2K§.addChild(this.§_-M2G§);
         this.buttonBuy = new §_-K2G§(gls("Купить"),80);
         this.buttonBuy.x = 410;
         this.buttonBuy.y = 180;
         this.buttonBuy.visible = false;
         this.buttonBuy.addEventListener(MouseEvent.CLICK,this.§_-G2T§);
         this.§_-K2K§.addChild(this.buttonBuy);
         this.§_-q1c§ = new ButtonShowMore();
         this.§_-q1c§.x = 600;
         this.§_-q1c§.y = 162;
         this.§_-q1c§.width = this.§_-q1c§.height = 28;
         this.§_-q1c§.visible = false;
         this.§_-q1c§.addEventListener(MouseEvent.CLICK,this.§_-G2T§);
         this.§_-K2K§.addChild(this.§_-q1c§);
         this.§_-C23§ = new §_-L2v§(2,5,0,0,95,59,0,0);
         this.§_-C23§.x = 85;
         this.§_-C23§.y = 195;
         this.§_-K2K§.addChild(this.§_-C23§);
         this.§_-Ej§ = new §_-O1p§(this.§_-y1x§);
         this.§_-Ej§.x = 660;
         this.§_-Ej§.y = 205;
         this.§_-K2K§.addChild(this.§_-Ej§);
         this.hero = new §_-o1H§();
         this.hero.x = 450;
         this.hero.y = 390;
         this.§_-K2K§.addChild(this.hero);
         this.§_-y6§ = §_-Zy§.§_-BI§ ? new ButtonWardrobeLackSkin() : new ButtonWardrobeLackSkinEn();
         this.§_-y6§.x = 450;
         this.§_-y6§.y = 330;
         this.§_-y6§.visible = false;
         this.§_-y6§.addEventListener(MouseEvent.CLICK,this.§_-G2T§);
         this.§_-K2K§.addChild(this.§_-y6§);
         this.§_-u2Z§ = §_-Zy§.§_-BI§ ? new ButtonWardrobeClosedSkin() : new ButtonWardrobeClosedSkinEn();
         this.§_-u2Z§.x = 450;
         this.§_-u2Z§.y = 330;
         this.§_-u2Z§.visible = false;
         this.§_-u2Z§.addEventListener(MouseEvent.CLICK,this.§_-G2T§);
         this.§_-K2K§.addChild(this.§_-u2Z§);
         this.§_-t15§ = new WardrobeOutfitSkinsPanel();
         this.§_-t15§.scaleX = this.§_-t15§.scaleY = 0.9;
         this.§_-t15§.x = 342;
         this.§_-t15§.y = 400;
         this.§_-t15§.addEventListener(WardrobeOutfitSkinsPanel.SELECT_SKIN,this.§_-A15§);
         this.§_-K2K§.addChild(this.§_-t15§);
         this.§_-X1o§ = new Sprite();
         var _loc3_:Sprite = new Sprite();
         _loc3_.y = 25;
         _loc3_.graphics.beginFill(0,0.25);
         _loc3_.graphics.drawRoundRectComplex(0,0,§_-Zy§.§_-21V§,120,5,5,0,0);
         this.§_-X1o§.addChild(_loc3_);
         this.§_-f2s§ = new §_-22q§();
         this.§_-f2s§.§_-L2q§ = this.§_-t15§;
         this.§_-f2s§.character = §_-P2x§.§_-V1n§;
         this.§_-f2s§.x = 24;
         this.§_-f2s§.y = 35;
         this.§_-f2s§.addEventListener(§_-h2m§.SELECTED,this.§_-F2C§);
         this.§_-X1o§.addChild(this.§_-f2s§);
         this.§_-c1§ = new §_-22q§();
         this.§_-c1§.§_-L2q§ = this.§_-t15§;
         this.§_-c1§.character = §_-P2x§.§_-qQ§;
         this.§_-c1§.x = 24;
         this.§_-c1§.y = 35;
         this.§_-c1§.addEventListener(§_-h2m§.SELECTED,this.§_-F2C§);
         this.§_-b2Q§ = new §_-Hg§();
         this.§_-K2B§ = new §_-uH§(new §_-Q1W§(gls("Белка"),§_-D1O§,ButtonFooterTabBack));
         this.§_-K2B§.x = 5;
         this.§_-K2B§.addEventListener(§_-b2G§.SELECT,this.§_-c2c§);
         this.§_-b2Q§.insert(this.§_-K2B§,[this.§_-f2s§]);
         this.§_-Bu§ = new §_-uH§(new §_-Q1W§(gls("Шаман"),§_-D1O§,ButtonFooterTabBack));
         this.§_-Bu§.x = this.§_-K2B§.x + this.§_-K2B§.width + 5;
         this.§_-Bu§.addEventListener(§_-b2G§.SELECT,this.§_-w2O§);
         this.§_-b2Q§.insert(this.§_-Bu§,[this.§_-c1§]);
         var _loc4_:int = §_-Zy§.§_-21V§ + 4 - (this.§_-Bu§.x + this.§_-Bu§.width + 18);
         types = [§_-P2x§.§_-w1K§,§_-P2x§.§_-B1R§,§_-P2x§.§_-01k§,§_-P2x§.§_-M2R§,§_-P2x§.§_-z2g§,§_-P2x§.§_-m1o§];
         var _loc5_:Array = [ButtonWardrobeCloak,ButtonWardrobeGlass,ButtonWardrobeHands,ButtonWardrobeNeck,ButtonWardrobeTail,ButtonWardrobeHair];
         var _loc6_:Array = [gls("Плащи"),gls("Очки"),gls("Аксессуары в руки"),gls("Ожерелья"),gls("Аксессуары на хвост"),gls("Аксессуары на голову")];
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_.length)
         {
            _loc8_ = new §_-L21§(types[_loc7_]);
            _loc8_.x = 129;
            _loc8_.y = 35;
            this.§_-X1o§.addChild(_loc8_);
            this.§_-82C§.push(_loc8_);
            _loc9_ = new §_-uH§(new _loc5_[_loc7_]());
            _loc9_.x = _loc4_;
            _loc9_.y = 25;
            _loc9_.addEventListener(§_-b2G§.SELECT,this.§_-Xr§);
            this.§_-b2Q§.insert(_loc9_,_loc8_);
            this.§_-8U§.push(_loc9_);
            new §_-kr§(this.§_-8U§[_loc7_],_loc6_[_loc7_]);
            _loc4_ = _loc9_.x + _loc9_.width + 2;
            _loc7_++;
         }
         this.§_-X1o§.addChild(this.§_-b2Q§);
         addChild(this.§_-X1o§);
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-w2y§);
         this.§_-w2y§();
      }
      
      private function §_-y1x§(param1:int) : void
      {
         this.§_-8U§[param1].dispatchEvent(new §_-b2G§(§_-b2G§.SELECT,this.§_-8U§[param1]));
      }
      
      private function §_-A15§(param1:Event) : void
      {
         if(!this.§_-t15§.parent)
         {
            return;
         }
         §_-x2y§.§_-R2f§(§_-L1o§.§_-U1v§,this.§_-t15§.§_-ub§);
      }
      
      private function §_-ge§(param1:MouseEvent) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         if(§_-13z§ == -1)
         {
            return;
         }
         if(§_-13z§ == §_-L1o§.§_-U1v§ && §_-P2x§.§_-Q1Y§(§_-D1h§))
         {
            _loc3_ = §_-L1o§.§_-WM§(§_-P2x§.§_-g1g§(§_-D1h§));
            if(_loc3_ != -1)
            {
               §_-L1o§.§_-R2f§(§_-L1o§.§_-U1v§,_loc3_);
            }
            _loc2_ = true;
         }
         else
         {
            _loc2_ = §_-L1o§.§_-M2a§(§_-D1h§,§_-13z§) && §_-13z§ == §_-L1o§.§_-U1v§;
            §_-L1o§.§_-R2f§(§_-13z§,§_-D1h§);
         }
         if(_loc2_)
         {
            this.§_-V21§().§_-u1p§();
         }
      }
      
      private function §_-F2C§(param1:§_-h2m§) : void
      {
         if(!param1.currentTarget.parent)
         {
            return;
         }
         if(param1.element == null)
         {
            this.§_-C23§.visible = false;
            return;
         }
         var _loc2_:int = (param1.element as §_-2n§).id;
         if(§_-P2x§.§_-Q1Y§(_loc2_))
         {
            this.§_-R2f§(§_-L1o§.§_-U1v§,_loc2_);
            return;
         }
         this.§_-C23§.visible = true;
         var _loc3_:§_-h2f§ = new §_-h2f§(§_-Q1j§);
         _loc3_.setData(§_-P2x§.§_-T§(_loc2_).filter(§_-P2x§.§_-y2T§));
         var _loc4_:Array = §_-P2x§.§_-DA§(_loc2_);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            if(§_-L1o§.§_-J2p§(_loc4_[_loc5_],§_-L1o§.§_-U1v§))
            {
               _loc3_.addObject(new §_-M1l§(_loc4_[_loc5_]));
            }
            _loc5_++;
         }
         this.§_-C23§.setData(_loc3_);
      }
      
      private function §_-c2c§(param1:Event) : void
      {
         this.§_-KC§ = §_-P2x§.§_-V1n§;
         this.§_-Nd§();
         this.§_-Ej§.visible = true;
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-8U§.length)
         {
            this.§_-8U§[_loc2_].visible = true;
            _loc2_++;
         }
         if(this.§_-X1o§.contains(this.§_-c1§))
         {
            this.§_-X1o§.removeChild(this.§_-c1§);
         }
         this.§_-X1o§.addChild(this.§_-f2s§);
         this.§_-Q11§();
      }
      
      private function §_-w2O§(param1:Event) : void
      {
         this.§_-KC§ = §_-P2x§.§_-qQ§;
         this.§_-Nd§();
         this.§_-Ej§.visible = false;
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-8U§.length)
         {
            this.§_-8U§[_loc2_].visible = false;
            _loc2_++;
         }
         if(this.§_-8U§.indexOf(this.§_-b2Q§.selected) != -1)
         {
            this.§_-b2Q§.§_-l1Y§(this.§_-K2B§);
         }
         this.§_-X1o§.addChild(this.§_-c1§);
         if(this.§_-X1o§.contains(this.§_-f2s§))
         {
            this.§_-X1o§.removeChild(this.§_-f2s§);
         }
         this.§_-Q11§();
      }
      
      private function §_-Nd§() : void
      {
         §_-41F§[§_-13z§] = §_-D1h§;
         this.§_-Q11§();
         §_-13z§ = -1;
         §_-D1h§ = -1;
         if(§_-L1o§.§_-U1v§ in §_-41F§)
         {
            §_-13z§ = §_-L1o§.§_-U1v§;
            §_-D1h§ = §_-41F§[§_-13z§];
            this.§_-R2f§(§_-13z§,§_-D1h§);
         }
      }
      
      private function §_-Xr§(param1:§_-b2G§) : void
      {
         var _loc2_:int = this.§_-8U§.indexOf(param1.button);
         var _loc3_:int = int(types[_loc2_]);
         var _loc4_:int = _loc3_;
         §_-41F§[§_-13z§] = §_-D1h§;
         this.§_-Q11§();
         §_-13z§ = -1;
         §_-D1h§ = -1;
         if(§_-L1o§.§_-d1W§ in §_-41F§)
         {
            if(!(_loc4_ in §_-FJ§))
            {
               return;
            }
            §_-13z§ = §_-L1o§.§_-d1W§;
            §_-D1h§ = §_-FJ§[_loc4_];
            this.§_-R2f§(§_-13z§,§_-D1h§);
         }
      }
      
      private function update(param1:GameEvent = null) : void
      {
         if(!this.§_-u21§)
         {
            return;
         }
         this.§_-zI§(this.§_-f2s§,§_-P2x§.§_-V1n§);
         this.§_-zI§(this.§_-c1§,§_-P2x§.§_-qQ§);
      }
      
      private function §_-zI§(param1:§_-22q§, param2:int) : void
      {
         var tapePackageData:§_-hu§;
         var tapeView:§_-22q§ = param1;
         var character:int = param2;
         var ids:Array = §_-L1o§.§_-f13§.filter(function(param1:int, param2:int, param3:Array):Boolean
         {
            if(Boolean(param2) || Boolean(param3))
            {
            }
            return §_-P2x§.§_-VY§(param1) == character;
         });
         ids.unshift(§_-P2x§.§_-Iz§(character));
         tapePackageData = new §_-hu§();
         tapePackageData.setData(ids);
         tapeView.setData(tapePackageData);
      }
      
      private function §_-Q11§(param1:GameEvent = null) : void
      {
         if(!this.§_-u21§)
         {
            return;
         }
         this.§_-rh§(§_-L1o§.§_-m2I§);
         this.hero.§_-VM§(§_-L1o§.§_-m2I§,§_-L1o§.§_-ig§);
         var _loc2_:§_-22q§ = this.§_-V21§();
         _loc2_.select(_loc2_.§_-02G§);
         this.§_-y6§.visible = false;
         this.§_-u2Z§.visible = false;
         if(§_-13z§ == §_-L1o§.§_-U1v§ && §_-P2x§.§_-Q1Y§(§_-D1h§))
         {
            return;
         }
         var _loc3_:Boolean = !§_-L1o§.§_-J2p§(§_-D1h§,§_-13z§);
         this.§_-Y1K§.visible = !_loc3_ && !§_-L1o§.§_-M2a§(§_-D1h§,§_-13z§);
         this.§_-M2G§.visible = !_loc3_ && §_-L1o§.§_-M2a§(§_-D1h§,§_-13z§);
      }
      
      private function §_-T13§(param1:GameEvent = null) : void
      {
         var i:int = 0;
         var data:§_-o2N§ = null;
         var e:GameEvent = param1;
         if(!this.§_-u21§)
         {
            return;
         }
         i = 0;
         while(i < types.length)
         {
            data = new §_-o2N§(§_-dM§);
            data.setData(§_-L1o§.§_-Ki§.filter(function(param1:int, param2:int, param3:Array):Boolean
            {
               if(Boolean(param2) || Boolean(param3))
               {
               }
               var _loc4_:* = §_-P2x§.§_-01x§(param1);
               return _loc4_ == types[i];
            }));
            this.§_-82C§[i].setData(data);
            i++;
         }
      }
      
      private function §_-G2T§(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         §_-U2d§.load(function():void
         {
            §_-534§.instance.show();
            if(§_-13z§ == §_-L1o§.§_-U1v§)
            {
               §_-534§.§_-115§(§_-P2x§.§_-b2c§(§_-D1h§),§_-D1h§);
            }
         });
      }
      
      private function §_-R2f§(param1:int, param2:int) : void
      {
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:String = null;
         var _loc12_:int = 0;
         if(param1 == §_-L1o§.§_-U1v§ && §_-P2x§.§_-Q1Y§(param2))
         {
            this.§_-M22§(param2);
            return;
         }
         var _loc3_:Array = §_-L1o§.§_-m2I§.slice();
         var _loc4_:Array = §_-L1o§.§_-ig§.slice();
         §_-13z§ = param1;
         §_-D1h§ = param2;
         if(§_-13z§ == §_-L1o§.§_-d1W§)
         {
            §_-FJ§[§_-P2x§.§_-01x§(§_-D1h§)] = §_-D1h§;
         }
         var _loc5_:Array = §_-13z§ == §_-L1o§.§_-U1v§ ? _loc3_ : _loc4_;
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_.length)
         {
            if(§_-13z§ == §_-L1o§.§_-U1v§)
            {
               _loc9_ = §_-P2x§.§_-VY§(§_-P2x§.§_-b2c§(_loc5_[_loc7_]));
               _loc10_ = §_-P2x§.§_-VY§(§_-P2x§.§_-b2c§(param2));
            }
            else
            {
               _loc9_ = §_-P2x§.§_-01x§(_loc4_[_loc7_]);
               _loc10_ = §_-P2x§.§_-01x§(param2);
            }
            if(_loc9_ == _loc10_)
            {
               _loc5_[_loc7_] = param2;
               _loc6_ = true;
            }
            _loc7_++;
         }
         if(!_loc6_)
         {
            _loc5_.push(param2);
         }
         if(§_-13z§ == §_-L1o§.§_-U1v§)
         {
            _loc11_ = §_-P2x§.§_-01H§(§_-D1h§);
            this.§_-314§.setStatus("<body><b><span class = \'center\'>" + §_-r1G§.span(_loc11_,"green") + "</span></b><br/>" + §_-P2x§.§_-T1O§(§_-D1h§) + "</body>");
            this.§_-314§.add();
         }
         else
         {
            _loc11_ = §_-P2x§.§_-d1E§(§_-D1h§);
            this.§_-314§.remove();
         }
         this.§_-Y1T§.text = _loc11_;
         this.§_-rh§(_loc3_);
         this.hero.§_-VM§(_loc3_,_loc4_);
         this.§_-u2Z§.visible = false;
         this.§_-y6§.visible = false;
         if(§_-L1o§.§_-G2K§(§_-D1h§) && §_-13z§ == §_-L1o§.§_-U1v§)
         {
            if(!this.§_-Ja§)
            {
               this.§_-Ja§ = new §_-918§(§_-D1h§);
               this.§_-Ja§.scaleX = this.§_-Ja§.scaleY = 0.65;
               this.§_-Ja§.x = (§_-Zy§.§_-21V§ - this.§_-Ja§.width) * 0.5;
               this.§_-Ja§.y = 205;
            }
            this.§_-Ja§.id = §_-D1h§;
            this.§_-K2K§.addChild(this.§_-Ja§);
         }
         else if(Boolean(this.§_-Ja§) && contains(this.§_-Ja§))
         {
            removeChild(this.§_-Ja§);
         }
         if(§_-13z§ == §_-L1o§.§_-U1v§)
         {
            _loc12_ = §_-P2x§.§_-93Q§(§_-D1h§);
            if(!§_-L1o§.§_-02s§(_loc12_))
            {
               this.§_-u2Z§.visible = _loc12_ != §_-D1h§ && §_-L1o§.§_-J2p§(§_-D1h§,§_-13z§);
               this.§_-y6§.visible = _loc12_ == §_-D1h§ || !§_-L1o§.§_-J2p§(§_-D1h§,§_-13z§);
               this.§_-Y1K§.visible = false;
               this.§_-M2G§.visible = false;
               this.§_-q1c§.visible = true;
               this.buttonBuy.visible = false;
               return;
            }
         }
         var _loc8_:Boolean = !§_-L1o§.§_-J2p§(§_-D1h§,§_-13z§);
         this.§_-Y1K§.visible = !_loc8_ && !§_-L1o§.§_-M2a§(§_-D1h§,§_-13z§);
         this.§_-M2G§.visible = !_loc8_ && §_-L1o§.§_-M2a§(§_-D1h§,§_-13z§);
         this.§_-q1c§.visible = !_loc8_ && §_-13z§ == §_-L1o§.§_-U1v§ && §_-P2x§.getPackageCoinsPrice(§_-D1h§) > 0;
         this.buttonBuy.visible = _loc8_;
      }
      
      private function §_-M22§(param1:int) : void
      {
         var _loc5_:int = 0;
         §_-13z§ = §_-L1o§.§_-U1v§;
         §_-D1h§ = param1;
         this.§_-C23§.visible = false;
         this.§_-314§.remove();
         this.§_-Y1T§.text = §_-P2x§.§_-01H§(param1);
         var _loc2_:int = §_-P2x§.§_-g1g§(param1);
         var _loc3_:int = §_-L1o§.§_-WM§(_loc2_);
         var _loc4_:Array = [];
         for each(_loc5_ in §_-L1o§.§_-m2I§)
         {
            if(!(_loc5_ == param1 || _loc5_ == _loc3_))
            {
               _loc4_.push(_loc5_);
            }
         }
         this.§_-rh§(_loc4_,_loc2_);
         this.hero.§_-VM§(_loc4_,§_-L1o§.§_-ig§);
         this.§_-u2Z§.visible = false;
         this.§_-y6§.visible = false;
         this.§_-Y1K§.visible = _loc3_ != -1;
         this.§_-M2G§.visible = false;
         this.§_-q1c§.visible = false;
         this.buttonBuy.visible = false;
         if(Boolean(this.§_-Ja§) && contains(this.§_-Ja§))
         {
            removeChild(this.§_-Ja§);
         }
      }
      
      private function §_-U1J§(param1:GameEvent) : void
      {
         this.§_-Z6§.load(Game.self["interior"]);
      }
      
      private function §_-w2y§(param1:Event = null) : void
      {
         this.§_-K2K§.x = (Game.starling.stage.stageWidth - §_-Zy§.§_-21V§) * 0.5;
         this.§_-K2K§.y = (Game.starling.stage.stageHeight - §_-Zy§.§_-02T§) * 0.5;
         this.§_-X1o§.x = (Game.starling.stage.stageWidth - §_-Zy§.§_-21V§) * 0.5;
         this.§_-X1o§.y = Game.starling.stage.stageHeight - this.§_-X1o§.height + 2;
      }
      
      private function §_-r2J§(param1:int) : void
      {
         var _loc2_:BitmapData = new BitmapData(312,222,true,0);
         this.hero.§_-G1u§ = true;
         if(§_-S2i§)
         {
            this.hero.view = §_-P2x§.§_-VD§(param1);
            this.hero.§_-VM§([param1],§_-P2x§.§_-L19§(param1));
         }
         else
         {
            this.hero.§_-VM§([],[param1]);
         }
         this.hero.§_-G1u§ = false;
         _loc2_.draw(this.hero,new Matrix(1.2,0,0,1.2,151,216));
         if(§_-S2i§)
         {
            §_-m2d§.save(_loc2_,"ImagePackage" + param1,false);
         }
         else
         {
            §_-m2d§.save(_loc2_,"ImageAccessories" + param1,false);
         }
         ++§_-S2§;
      }
   }
}

