package §_-T2y§
{
   import §_-68§.§_-EI§;
   import §_-D2q§.§_-m1L§;
   import §_-I10§.§_-f22§;
   import §_-I10§.§_-g2W§;
   import §_-I10§.§_-h1f§;
   import §_-e1G§.§_-Hb§;
   import §_-e1G§.§_-o2m§;
   import §_-r2Y§.§_-33e§;
   import §_-s2u§.§_-IU§;
   import §_-s2u§.§_-l2n§;
   import §_-z2Z§.WardrobeOutfitSkinsPanel;
   import §_-z2Z§.§_-C1C§;
   import §_-z2Z§.§_-Nt§;
   import §_-z2Z§.§_-TI§;
   import §_-z2Z§.§_-q1D§;
   import buttons.§_-F1F§;
   import buttons.§_-G2L§;
   import buttons.§_-LD§;
   import buttons.§_-T2z§;
   import buttons.§_-j18§;
   import events.GameEvent;
   import events.§_-4Y§;
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
   import tape.§_-3l§;
   import tape.§_-91w§;
   import tape.§_-A3s§;
   import tape.§_-xc§;
   import utils.§_-xb§;
   import views.§_-52O§;
   import views.§_-B2T§;
   import views.§_-DR§;
   import views.§_-m10§;
   
   public class §_-ac§ extends Screen
   {
      
      private static var _instance:§_-ac§;
      
      public static const §_-HM§:Array = [new TextFormat(§_-22V§.§_-pJ§,18,8746579),new TextFormat(§_-22V§.§_-pJ§,18,8746579),new TextFormat(§_-22V§.§_-pJ§,18,8746579)];
      
      public static const §_-C1W§:Array = [new TextFormat(§_-22V§.§_-pJ§,12,16777215),new TextFormat(§_-22V§.§_-pJ§,12,16765761),new TextFormat(§_-22V§.§_-pJ§,12,16765761)];
      
      private static var §_-y28§:int = -1;
      
      private static var §_-P2x§:int = -1;
      
      private static var §_-21u§:Object = {};
      
      private static var types:Array = null;
      
      private static var §_-52T§:Object = {};
      
      private static var §_-o2R§:int = 223;
      
      private static var §_-225§:Boolean = false;
      
      public var hero:§_-DR§ = null;
      
      private var §_-P20§:Boolean = false;
      
      private var §_-C3d§:§_-B2T§;
      
      private var §_-H1g§:Sprite;
      
      private var §_-O1m§:Sprite;
      
      private var §_-S11§:int = 0;
      
      private var §_-g2V§:§_-G2L§ = null;
      
      private var §_-jJ§:§_-F1F§ = null;
      
      private var §_-G2B§:§_-F1F§ = null;
      
      private var §_-88§:Vector.<§_-F1F§> = new Vector.<§_-F1F§>(0);
      
      private var §_-XI§:§_-Nt§ = null;
      
      private var §_-E2u§:§_-Nt§ = null;
      
      private var §_-Gm§:WardrobeOutfitSkinsPanel = null;
      
      private var §_-N10§:Vector.<§_-q1D§> = new Vector.<§_-q1D§>(0);
      
      private var §_-81§:§_-3l§ = null;
      
      private var §_-t1h§:SimpleButton = null;
      
      private var §_-e2D§:SimpleButton = null;
      
      private var §_-b1D§:§_-m10§ = null;
      
      private var §_-g2g§:§_-j18§ = null;
      
      private var §_-92O§:§_-j18§ = null;
      
      private var buttonBuy:§_-j18§ = null;
      
      private var §_-C39§:SimpleButton = null;
      
      private var §_-zl§:§_-22V§ = null;
      
      private var §_-ES§:§_-o2m§ = null;
      
      private var §_-R2e§:§_-52O§ = null;
      
      public function §_-ac§()
      {
         _instance = this;
         super();
         §_-h1f§.addEventListener(GameEvent.CLOTHES_HERO_CHANGE,this.§_-Y1h§);
         §_-h1f§.addEventListener(GameEvent.CLOTHES_STORAGE_CHANGE,this.update);
         §_-h1f§.addEventListener(GameEvent.CLOTHES_STORAGE_CHANGE,this.§_-q2F§);
      }
      
      public static function get instance() : §_-ac§
      {
         return _instance;
      }
      
      public static function §_-s1C§(param1:int, param2:int) : void
      {
         if(!_instance || !_instance.§_-P20§)
         {
            return;
         }
         _instance.§_-s1C§(param1,param2);
      }
      
      override public function show() : void
      {
         super.show();
         if(!this.§_-P20§)
         {
            this.init();
            this.§_-P20§ = true;
            this.update();
            this.§_-q2F§();
            this.§_-22M§(§_-h1f§.§_-IS§);
            this.hero.§_-7H§(§_-h1f§.§_-IS§,§_-h1f§.§_-51k§);
            this.§_-XI§.§_-r2M§();
            this.§_-E2u§.§_-r2M§();
            this.§_-t1h§.visible = false;
         }
      }
      
      override public function hide() : void
      {
         super.hide();
         §_-5B§.§_-Y1h§();
      }
      
      public function get §_-nf§() : int
      {
         return this.§_-S11§;
      }
      
      private function §_-23r§() : §_-Nt§
      {
         return this.§_-S11§ == §_-g2W§.§_-y1I§ ? this.§_-E2u§ : this.§_-XI§;
      }
      
      private function §_-22M§(param1:Array, param2:int = -1) : void
      {
         if(param2 == -1)
         {
            param2 = this.§_-S11§;
         }
         this.hero.shaman = param2 == §_-g2W§.§_-y1I§;
         this.hero.view = this.hero.shaman ? §_-g2W§.§_-YG§ : §_-g2W§.§_-Y2z§(param1);
      }
      
      private function init() : void
      {
         var _loc8_:§_-q1D§ = null;
         var _loc9_:§_-F1F§ = null;
         this.§_-C3d§ = new §_-B2T§(Game.self["interior"],true);
         addChild(this.§_-C3d§);
         §_-f22§.addEventListener(GameEvent.INTERIOR_CHANGE,this.§_-oZ§);
         this.§_-H1g§ = new Sprite();
         addChild(this.§_-H1g§);
         this.§_-H1g§.addChild(new ScreenWardrobeBackground());
         var _loc1_:§_-LD§ = new §_-LD§(false);
         _loc1_.x = 595;
         _loc1_.y = 385;
         this.§_-H1g§.addChild(_loc1_);
         var _loc2_:§_-22V§ = new §_-22V§(gls("Магия"),70,149,new TextFormat(§_-22V§.§_-pJ§,20,16773053,null,null,null,null,null,"center"),170);
         _loc2_.filters = [new GlowFilter(4134672,1,4,4,8),new DropShadowFilter(2,45,0,1,2,2,0.25)];
         this.§_-H1g§.addChild(_loc2_);
         _loc2_ = new §_-22V§(gls("Аксессуары"),665,149,new TextFormat(§_-22V§.§_-pJ§,20,16773053,null,null,null,null,null,"center"),170);
         _loc2_.filters = [new GlowFilter(4134672,1,4,4,8),new DropShadowFilter(2,45,0,1,2,2,0.25)];
         this.§_-H1g§.addChild(_loc2_);
         this.§_-zl§ = new §_-22V§("",300,146,new TextFormat(§_-22V§.§_-pJ§,20,16773053,null,null,null,null,null,"center"),300);
         this.§_-zl§.filters = [new GlowFilter(4134672,1,4,4,8),new DropShadowFilter(2,45,0,1,2,2,0.25)];
         this.§_-H1g§.addChild(this.§_-zl§);
         this.§_-ES§ = new §_-o2m§(this.§_-zl§,"");
         this.§_-g2g§ = new §_-j18§(gls("Надеть"),80);
         this.§_-g2g§.x = 410;
         this.§_-g2g§.y = 180;
         this.§_-g2g§.visible = false;
         this.§_-g2g§.addEventListener(MouseEvent.CLICK,this.§_-d1D§);
         this.§_-g2g§.§_-v5§();
         this.§_-H1g§.addChild(this.§_-g2g§);
         this.§_-92O§ = new §_-j18§(gls("Снять"),80);
         this.§_-92O§.x = 410;
         this.§_-92O§.y = 180;
         this.§_-92O§.visible = false;
         this.§_-92O§.addEventListener(MouseEvent.CLICK,this.§_-d1D§);
         this.§_-92O§.§_-52e§();
         this.§_-H1g§.addChild(this.§_-92O§);
         this.buttonBuy = new §_-j18§(gls("Купить"),80);
         this.buttonBuy.x = 410;
         this.buttonBuy.y = 180;
         this.buttonBuy.visible = false;
         this.buttonBuy.addEventListener(MouseEvent.CLICK,this.§_-r1S§);
         this.§_-H1g§.addChild(this.buttonBuy);
         this.§_-C39§ = new ButtonShowMore();
         this.§_-C39§.x = 600;
         this.§_-C39§.y = 162;
         this.§_-C39§.width = this.§_-C39§.height = 28;
         this.§_-C39§.visible = false;
         this.§_-C39§.addEventListener(MouseEvent.CLICK,this.§_-r1S§);
         this.§_-H1g§.addChild(this.§_-C39§);
         this.§_-81§ = new §_-3l§(2,5,0,0,95,59,0,0);
         this.§_-81§.x = 85;
         this.§_-81§.y = 195;
         this.§_-H1g§.addChild(this.§_-81§);
         this.§_-b1D§ = new §_-m10§(this.§_-qx§);
         this.§_-b1D§.x = 660;
         this.§_-b1D§.y = 205;
         this.§_-H1g§.addChild(this.§_-b1D§);
         this.hero = new §_-DR§();
         this.hero.x = 450;
         this.hero.y = 390;
         this.§_-H1g§.addChild(this.hero);
         this.§_-t1h§ = §_-a9§.§_-sc§ ? new ButtonWardrobeLackSkin() : new ButtonWardrobeLackSkinEn();
         this.§_-t1h§.x = 450;
         this.§_-t1h§.y = 330;
         this.§_-t1h§.visible = false;
         this.§_-t1h§.addEventListener(MouseEvent.CLICK,this.§_-r1S§);
         this.§_-H1g§.addChild(this.§_-t1h§);
         this.§_-e2D§ = §_-a9§.§_-sc§ ? new ButtonWardrobeClosedSkin() : new ButtonWardrobeClosedSkinEn();
         this.§_-e2D§.x = 450;
         this.§_-e2D§.y = 330;
         this.§_-e2D§.visible = false;
         this.§_-e2D§.addEventListener(MouseEvent.CLICK,this.§_-r1S§);
         this.§_-H1g§.addChild(this.§_-e2D§);
         this.§_-Gm§ = new WardrobeOutfitSkinsPanel();
         this.§_-Gm§.scaleX = this.§_-Gm§.scaleY = 0.9;
         this.§_-Gm§.x = 342;
         this.§_-Gm§.y = 400;
         this.§_-Gm§.addEventListener(WardrobeOutfitSkinsPanel.SELECT_SKIN,this.§_-Y2a§);
         this.§_-H1g§.addChild(this.§_-Gm§);
         this.§_-O1m§ = new Sprite();
         var _loc3_:Sprite = new Sprite();
         _loc3_.y = 25;
         _loc3_.graphics.beginFill(0,0.25);
         _loc3_.graphics.drawRoundRectComplex(0,0,§_-a9§.§_-9o§,120,5,5,0,0);
         this.§_-O1m§.addChild(_loc3_);
         this.§_-XI§ = new §_-Nt§();
         this.§_-XI§.§_-C2w§ = this.§_-Gm§;
         this.§_-XI§.character = §_-g2W§.§_-k2t§;
         this.§_-XI§.x = 24;
         this.§_-XI§.y = 35;
         this.§_-XI§.addEventListener(§_-33e§.SELECTED,this.§_-52C§);
         this.§_-O1m§.addChild(this.§_-XI§);
         this.§_-E2u§ = new §_-Nt§();
         this.§_-E2u§.§_-C2w§ = this.§_-Gm§;
         this.§_-E2u§.character = §_-g2W§.§_-y1I§;
         this.§_-E2u§.x = 24;
         this.§_-E2u§.y = 35;
         this.§_-E2u§.addEventListener(§_-33e§.SELECTED,this.§_-52C§);
         this.§_-g2V§ = new §_-G2L§();
         this.§_-jJ§ = new §_-F1F§(new §_-T2z§(gls("Белка"),§_-C1W§,ButtonFooterTabBack));
         this.§_-jJ§.x = 5;
         this.§_-jJ§.addEventListener(§_-4Y§.SELECT,this.§_-P29§);
         this.§_-g2V§.insert(this.§_-jJ§,[this.§_-XI§]);
         this.§_-G2B§ = new §_-F1F§(new §_-T2z§(gls("Шаман"),§_-C1W§,ButtonFooterTabBack));
         this.§_-G2B§.x = this.§_-jJ§.x + this.§_-jJ§.width + 5;
         this.§_-G2B§.addEventListener(§_-4Y§.SELECT,this.§_-H1u§);
         this.§_-g2V§.insert(this.§_-G2B§,[this.§_-E2u§]);
         var _loc4_:int = §_-a9§.§_-9o§ + 4 - (this.§_-G2B§.x + this.§_-G2B§.width + 18);
         types = [§_-g2W§.§_-v1b§,§_-g2W§.§_-g1h§,§_-g2W§.§_-91o§,§_-g2W§.§_-k2J§,§_-g2W§.§_-O2l§,§_-g2W§.§_-t10§];
         var _loc5_:Array = [ButtonWardrobeCloak,ButtonWardrobeGlass,ButtonWardrobeHands,ButtonWardrobeNeck,ButtonWardrobeTail,ButtonWardrobeHair];
         var _loc6_:Array = [gls("Плащи"),gls("Очки"),gls("Аксессуары в руки"),gls("Ожерелья"),gls("Аксессуары на хвост"),gls("Аксессуары на голову")];
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_.length)
         {
            _loc8_ = new §_-q1D§(types[_loc7_]);
            _loc8_.x = 129;
            _loc8_.y = 35;
            this.§_-O1m§.addChild(_loc8_);
            this.§_-N10§.push(_loc8_);
            _loc9_ = new §_-F1F§(new _loc5_[_loc7_]());
            _loc9_.x = _loc4_;
            _loc9_.y = 25;
            _loc9_.addEventListener(§_-4Y§.SELECT,this.§_-q14§);
            this.§_-g2V§.insert(_loc9_,_loc8_);
            this.§_-88§.push(_loc9_);
            new §_-Hb§(this.§_-88§[_loc7_],_loc6_[_loc7_]);
            _loc4_ = _loc9_.x + _loc9_.width + 2;
            _loc7_++;
         }
         this.§_-O1m§.addChild(this.§_-g2V§);
         addChild(this.§_-O1m§);
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-5W§);
         this.§_-5W§();
      }
      
      private function §_-qx§(param1:int) : void
      {
         this.§_-88§[param1].dispatchEvent(new §_-4Y§(§_-4Y§.SELECT,this.§_-88§[param1]));
      }
      
      private function §_-Y2a§(param1:Event) : void
      {
         if(!this.§_-Gm§.parent)
         {
            return;
         }
         §_-ac§.§_-s1C§(§_-h1f§.§_-A3r§,this.§_-Gm§.§_-D27§);
      }
      
      private function §_-d1D§(param1:MouseEvent) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         if(§_-P2x§ == -1)
         {
            return;
         }
         if(§_-P2x§ == §_-h1f§.§_-A3r§ && §_-g2W§.§_-Kg§(§_-y28§))
         {
            _loc3_ = §_-h1f§.§_-Y2o§(§_-g2W§.§_-43l§(§_-y28§));
            if(_loc3_ != -1)
            {
               §_-h1f§.§_-s1C§(§_-h1f§.§_-A3r§,_loc3_);
            }
            _loc2_ = true;
         }
         else
         {
            _loc2_ = §_-h1f§.§_-ai§(§_-y28§,§_-P2x§) && §_-P2x§ == §_-h1f§.§_-A3r§;
            §_-h1f§.§_-s1C§(§_-P2x§,§_-y28§);
         }
         if(_loc2_)
         {
            this.§_-23r§().§_-ja§();
         }
      }
      
      private function §_-52C§(param1:§_-33e§) : void
      {
         if(!param1.currentTarget.parent)
         {
            return;
         }
         if(param1.element == null)
         {
            this.§_-81§.visible = false;
            return;
         }
         var _loc2_:int = (param1.element as §_-A3s§).id;
         if(§_-g2W§.§_-Kg§(_loc2_))
         {
            this.§_-s1C§(§_-h1f§.§_-A3r§,_loc2_);
            return;
         }
         this.§_-81§.visible = true;
         var _loc3_:§_-xc§ = new §_-xc§(§_-l2n§);
         _loc3_.setData(§_-g2W§.§_-433§(_loc2_).filter(§_-g2W§.§_-42y§));
         var _loc4_:Array = §_-g2W§.§_-H2J§(_loc2_);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            if(§_-h1f§.§_-i21§(_loc4_[_loc5_],§_-h1f§.§_-A3r§))
            {
               _loc3_.addObject(new §_-IU§(_loc4_[_loc5_]));
            }
            _loc5_++;
         }
         this.§_-81§.setData(_loc3_);
      }
      
      private function §_-P29§(param1:Event) : void
      {
         this.§_-S11§ = §_-g2W§.§_-k2t§;
         this.§_-a2c§();
         this.§_-b1D§.visible = true;
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-88§.length)
         {
            this.§_-88§[_loc2_].visible = true;
            _loc2_++;
         }
         if(this.§_-O1m§.contains(this.§_-E2u§))
         {
            this.§_-O1m§.removeChild(this.§_-E2u§);
         }
         this.§_-O1m§.addChild(this.§_-XI§);
         this.§_-Y1h§();
      }
      
      private function §_-H1u§(param1:Event) : void
      {
         this.§_-S11§ = §_-g2W§.§_-y1I§;
         this.§_-a2c§();
         this.§_-b1D§.visible = false;
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-88§.length)
         {
            this.§_-88§[_loc2_].visible = false;
            _loc2_++;
         }
         if(this.§_-88§.indexOf(this.§_-g2V§.selected) != -1)
         {
            this.§_-g2V§.§_-32c§(this.§_-jJ§);
         }
         this.§_-O1m§.addChild(this.§_-E2u§);
         if(this.§_-O1m§.contains(this.§_-XI§))
         {
            this.§_-O1m§.removeChild(this.§_-XI§);
         }
         this.§_-Y1h§();
      }
      
      private function §_-a2c§() : void
      {
         §_-21u§[§_-P2x§] = §_-y28§;
         this.§_-Y1h§();
         §_-P2x§ = -1;
         §_-y28§ = -1;
         if(§_-h1f§.§_-A3r§ in §_-21u§)
         {
            §_-P2x§ = §_-h1f§.§_-A3r§;
            §_-y28§ = §_-21u§[§_-P2x§];
            this.§_-s1C§(§_-P2x§,§_-y28§);
         }
      }
      
      private function §_-q14§(param1:§_-4Y§) : void
      {
         var _loc2_:int = this.§_-88§.indexOf(param1.button);
         var _loc3_:int = int(types[_loc2_]);
         var _loc4_:int = _loc3_;
         §_-21u§[§_-P2x§] = §_-y28§;
         this.§_-Y1h§();
         §_-P2x§ = -1;
         §_-y28§ = -1;
         if(§_-h1f§.§_-03X§ in §_-21u§)
         {
            if(!(_loc4_ in §_-52T§))
            {
               return;
            }
            §_-P2x§ = §_-h1f§.§_-03X§;
            §_-y28§ = §_-52T§[_loc4_];
            this.§_-s1C§(§_-P2x§,§_-y28§);
         }
      }
      
      private function update(param1:GameEvent = null) : void
      {
         if(!this.§_-P20§)
         {
            return;
         }
         this.§_-71I§(this.§_-XI§,§_-g2W§.§_-k2t§);
         this.§_-71I§(this.§_-E2u§,§_-g2W§.§_-y1I§);
      }
      
      private function §_-71I§(param1:§_-Nt§, param2:int) : void
      {
         var tapePackageData:§_-C1C§;
         var tapeView:§_-Nt§ = param1;
         var character:int = param2;
         var ids:Array = §_-h1f§.§_-Y1I§.filter(function(param1:int, param2:int, param3:Array):Boolean
         {
            if(Boolean(param2) || Boolean(param3))
            {
            }
            return §_-g2W§.§_-018§(param1) == character;
         });
         ids.unshift(§_-g2W§.§_-Kk§(character));
         tapePackageData = new §_-C1C§();
         tapePackageData.setData(ids);
         tapeView.setData(tapePackageData);
      }
      
      private function §_-Y1h§(param1:GameEvent = null) : void
      {
         if(!this.§_-P20§)
         {
            return;
         }
         this.§_-22M§(§_-h1f§.§_-IS§);
         this.hero.§_-7H§(§_-h1f§.§_-IS§,§_-h1f§.§_-51k§);
         var _loc2_:§_-Nt§ = this.§_-23r§();
         _loc2_.select(_loc2_.§_-Y1y§);
         this.§_-t1h§.visible = false;
         this.§_-e2D§.visible = false;
         if(§_-P2x§ == §_-h1f§.§_-A3r§ && §_-g2W§.§_-Kg§(§_-y28§))
         {
            return;
         }
         var _loc3_:Boolean = !§_-h1f§.§_-i21§(§_-y28§,§_-P2x§);
         this.§_-g2g§.visible = !_loc3_ && !§_-h1f§.§_-ai§(§_-y28§,§_-P2x§);
         this.§_-92O§.visible = !_loc3_ && §_-h1f§.§_-ai§(§_-y28§,§_-P2x§);
      }
      
      private function §_-q2F§(param1:GameEvent = null) : void
      {
         var i:int = 0;
         var data:§_-91w§ = null;
         var e:GameEvent = param1;
         if(!this.§_-P20§)
         {
            return;
         }
         i = 0;
         while(i < types.length)
         {
            data = new §_-91w§(§_-TI§);
            data.setData(§_-h1f§.§_-s2p§.filter(function(param1:int, param2:int, param3:Array):Boolean
            {
               if(Boolean(param2) || Boolean(param3))
               {
               }
               var _loc4_:* = §_-g2W§.§_-m1y§(param1);
               return _loc4_ == types[i];
            }));
            this.§_-N10§[i].setData(data);
            i++;
         }
      }
      
      private function §_-r1S§(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         §_-EI§.load(function():void
         {
            §_-m1L§.instance.show();
            if(§_-P2x§ == §_-h1f§.§_-A3r§)
            {
               §_-m1L§.§_-qc§(§_-g2W§.§_-X2e§(§_-y28§),§_-y28§);
            }
         });
      }
      
      private function §_-s1C§(param1:int, param2:int) : void
      {
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:String = null;
         var _loc12_:int = 0;
         if(param1 == §_-h1f§.§_-A3r§ && §_-g2W§.§_-Kg§(param2))
         {
            this.§_-e1p§(param2);
            return;
         }
         var _loc3_:Array = §_-h1f§.§_-IS§.slice();
         var _loc4_:Array = §_-h1f§.§_-51k§.slice();
         §_-P2x§ = param1;
         §_-y28§ = param2;
         if(§_-P2x§ == §_-h1f§.§_-03X§)
         {
            §_-52T§[§_-g2W§.§_-m1y§(§_-y28§)] = §_-y28§;
         }
         var _loc5_:Array = §_-P2x§ == §_-h1f§.§_-A3r§ ? _loc3_ : _loc4_;
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_.length)
         {
            if(§_-P2x§ == §_-h1f§.§_-A3r§)
            {
               _loc9_ = §_-g2W§.§_-018§(§_-g2W§.§_-X2e§(_loc5_[_loc7_]));
               _loc10_ = §_-g2W§.§_-018§(§_-g2W§.§_-X2e§(param2));
            }
            else
            {
               _loc9_ = §_-g2W§.§_-m1y§(_loc4_[_loc7_]);
               _loc10_ = §_-g2W§.§_-m1y§(param2);
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
         if(§_-P2x§ == §_-h1f§.§_-A3r§)
         {
            _loc11_ = §_-g2W§.§_-G1Y§(§_-y28§);
            this.§_-ES§.setStatus("<body><b><span class = \'center\'>" + §_-xb§.span(_loc11_,"green") + "</span></b><br/>" + §_-g2W§.§_-81F§(§_-y28§) + "</body>");
            this.§_-ES§.add();
         }
         else
         {
            _loc11_ = §_-g2W§.§_-224§(§_-y28§);
            this.§_-ES§.remove();
         }
         this.§_-zl§.text = _loc11_;
         this.§_-22M§(_loc3_);
         this.hero.§_-7H§(_loc3_,_loc4_);
         this.§_-e2D§.visible = false;
         this.§_-t1h§.visible = false;
         if(§_-h1f§.§_-62P§(§_-y28§) && §_-P2x§ == §_-h1f§.§_-A3r§)
         {
            if(!this.§_-R2e§)
            {
               this.§_-R2e§ = new §_-52O§(§_-y28§);
               this.§_-R2e§.scaleX = this.§_-R2e§.scaleY = 0.65;
               this.§_-R2e§.x = (§_-a9§.§_-9o§ - this.§_-R2e§.width) * 0.5;
               this.§_-R2e§.y = 205;
            }
            this.§_-R2e§.id = §_-y28§;
            this.§_-H1g§.addChild(this.§_-R2e§);
         }
         else if(Boolean(this.§_-R2e§) && contains(this.§_-R2e§))
         {
            removeChild(this.§_-R2e§);
         }
         if(§_-P2x§ == §_-h1f§.§_-A3r§)
         {
            _loc12_ = §_-g2W§.§_-s1h§(§_-y28§);
            if(!§_-h1f§.§_-x1C§(_loc12_))
            {
               this.§_-e2D§.visible = _loc12_ != §_-y28§ && §_-h1f§.§_-i21§(§_-y28§,§_-P2x§);
               this.§_-t1h§.visible = _loc12_ == §_-y28§ || !§_-h1f§.§_-i21§(§_-y28§,§_-P2x§);
               this.§_-g2g§.visible = false;
               this.§_-92O§.visible = false;
               this.§_-C39§.visible = true;
               this.buttonBuy.visible = false;
               return;
            }
         }
         var _loc8_:Boolean = !§_-h1f§.§_-i21§(§_-y28§,§_-P2x§);
         this.§_-g2g§.visible = !_loc8_ && !§_-h1f§.§_-ai§(§_-y28§,§_-P2x§);
         this.§_-92O§.visible = !_loc8_ && §_-h1f§.§_-ai§(§_-y28§,§_-P2x§);
         this.§_-C39§.visible = !_loc8_ && §_-P2x§ == §_-h1f§.§_-A3r§ && §_-g2W§.getPackageCoinsPrice(§_-y28§) > 0;
         this.buttonBuy.visible = _loc8_;
      }
      
      private function §_-e1p§(param1:int) : void
      {
         var _loc5_:int = 0;
         §_-P2x§ = §_-h1f§.§_-A3r§;
         §_-y28§ = param1;
         this.§_-81§.visible = false;
         this.§_-ES§.remove();
         this.§_-zl§.text = §_-g2W§.§_-G1Y§(param1);
         var _loc2_:int = §_-g2W§.§_-43l§(param1);
         var _loc3_:int = §_-h1f§.§_-Y2o§(_loc2_);
         var _loc4_:Array = [];
         for each(_loc5_ in §_-h1f§.§_-IS§)
         {
            if(!(_loc5_ == param1 || _loc5_ == _loc3_))
            {
               _loc4_.push(_loc5_);
            }
         }
         this.§_-22M§(_loc4_,_loc2_);
         this.hero.§_-7H§(_loc4_,§_-h1f§.§_-51k§);
         this.§_-e2D§.visible = false;
         this.§_-t1h§.visible = false;
         this.§_-g2g§.visible = _loc3_ != -1;
         this.§_-92O§.visible = false;
         this.§_-C39§.visible = false;
         this.buttonBuy.visible = false;
         if(Boolean(this.§_-R2e§) && contains(this.§_-R2e§))
         {
            removeChild(this.§_-R2e§);
         }
      }
      
      private function §_-oZ§(param1:GameEvent) : void
      {
         this.§_-C3d§.load(Game.self["interior"]);
      }
      
      private function §_-5W§(param1:Event = null) : void
      {
         this.§_-H1g§.x = (Game.starling.stage.stageWidth - §_-a9§.§_-9o§) * 0.5;
         this.§_-H1g§.y = (Game.starling.stage.stageHeight - §_-a9§.§_-31m§) * 0.5;
         this.§_-O1m§.x = (Game.starling.stage.stageWidth - §_-a9§.§_-9o§) * 0.5;
         this.§_-O1m§.y = Game.starling.stage.stageHeight - this.§_-O1m§.height + 2;
      }
      
      private function §_-2r§(param1:int) : void
      {
         var _loc2_:BitmapData = new BitmapData(312,222,true,0);
         this.hero.§_-vz§ = true;
         if(§_-225§)
         {
            this.hero.view = §_-g2W§.§_-z1V§(param1);
            this.hero.§_-7H§([param1],§_-g2W§.§_-e2y§(param1));
         }
         else
         {
            this.hero.§_-7H§([],[param1]);
         }
         this.hero.§_-vz§ = false;
         _loc2_.draw(this.hero,new Matrix(1.2,0,0,1.2,151,216));
         if(§_-225§)
         {
            §_-E1s§.save(_loc2_,"ImagePackage" + param1,false);
         }
         else
         {
            §_-E1s§.save(_loc2_,"ImageAccessories" + param1,false);
         }
         ++§_-o2R§;
      }
   }
}

