package §_-c2C§
{
   import §_-S1n§.§_-kr§;
   import §_-X1k§.NotificationManager;
   import §_-X1k§.§_-Ac§;
   import §_-X1k§.§_-LZ§;
   import §_-X1k§.§_-Q2l§;
   import §_-X1k§.§_-Wd§;
   import §_-X1k§.§_-XW§;
   import §_-X1k§.§_-hO§;
   import §_-X1k§.§_-i2a§;
   import §_-X1k§.§_-r12§;
   import §_-bN§.§_-710§;
   import §_-bN§.§_-Dn§;
   import §_-bN§.§_-TB§;
   import §_-bN§.§_-qC§;
   import §_-s2e§.§_-U2d§;
   import §_-xr§.§_-U2u§;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.GlowFilter;
   import flash.media.SoundChannel;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-n2E§;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   import utils.§_-12w§;
   import utils.§_-33I§;
   import utils.§_-d1t§;
   import utils.§_-k12§;
   import views.§_-N1t§;
   import views.§_-O2q§;
   import views.§_-aW§;
   
   public class §_-si§ extends Screen
   {
      
      private static const §_-M2x§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,14,0);
      
      private static const §_-I1y§:Array = [new GlowFilter(15065556,1,2,2,8,BitmapFilterQuality.MEDIUM)];
      
      private static const §_-S1S§:Array = [new GlowFilter(16777164,1,8,8,2,BitmapFilterQuality.MEDIUM)];
      
      private static const §_-S1Z§:Array = [new ColorMatrixFilter([0.3,0,0,0,0,0,0.3,0,0,0,0,0,0.3,0,0,0,0,0,1,0])];
      
      private static const §_-FK§:Array = [{
         "offsetX":90,
         "offsetY":-20,
         "rotate":0
      },{
         "offsetX":70,
         "offsetY":0,
         "rotate":90
      },{
         "offsetX":-80,
         "offsetY":40,
         "rotate":200
      },{
         "offsetX":-75,
         "offsetY":0,
         "rotate":270
      },{
         "offsetX":40,
         "offsetY":-60,
         "rotate":0
      },{
         "offsetX":60,
         "offsetY":-50,
         "rotate":0
      }];
      
      private static const §_-o2L§:Array = [{
         "offsetX":160,
         "offsetY":95,
         "rotate":70
      },{
         "offsetX":150,
         "offsetY":-160,
         "rotate":0
      },{
         "offsetX":-155,
         "offsetY":-55,
         "rotate":200
      }];
      
      private static var _instance:§_-si§ = null;
      
      private var §_-Nh§:Vector.<int> = new Vector.<int>(0);
      
      private var §_-535§:Object = {};
      
      private var §_-R2B§:Object = {};
      
      private var §_-o1O§:Object = {};
      
      private var bg:Sprite = null;
      
      private var §_-I1r§:Sprite = null;
      
      private var §_-H1e§:§_-n0§ = null;
      
      private var §_-X1c§:SoundChannel = null;
      
      private var §_-B1y§:Sprite = null;
      
      private var §_-L2D§:SimpleButton = null;
      
      private var §_-UO§:SimpleButton = null;
      
      private var §_-N1d§:SimpleButton = null;
      
      private var §_-R1F§:Sprite = null;
      
      public function §_-si§()
      {
         super();
         this.init();
         _instance = this;
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-W1l§,§_-s2l§.§_-13I§]);
      }
      
      public static function §_-eV§(param1:int) : void
      {
         _instance.§_-eV§(param1);
      }
      
      public static function §_-m1x§() : void
      {
         if(_instance == null)
         {
            return;
         }
         _instance.§_-m1x§();
      }
      
      public static function set §_-41R§(param1:Boolean) : void
      {
         if(!_instance)
         {
            return;
         }
         if(param1)
         {
            _instance.addChild(_instance.§_-R1F§);
         }
         else if(_instance.contains(_instance.§_-R1F§))
         {
            _instance.removeChild(_instance.§_-R1F§);
         }
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-m1x§();
         this.§_-w2y§();
         §_-d1t§.§_-224§();
      }
      
      override public function hide() : void
      {
         super.hide();
         this.§_-H1e§.§_-w2J§();
      }
      
      private function init() : void
      {
         this.§_-D1a§();
         this.§_-E1Z§();
         this.§_-m1x§();
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-w2y§);
      }
      
      private function §_-D1a§() : void
      {
         var _loc8_:Object = null;
         var _loc9_:Sprite = null;
         this.bg = new BackgroundScreenLocation();
         this.bg.cacheAsBitmap = true;
         addChild(this.bg);
         this.§_-I1r§ = new Sprite();
         addChild(this.§_-I1r§);
         var _loc1_:MainPlanet = new MainPlanet();
         _loc1_.x = 137;
         _loc1_.scaleX = _loc1_.scaleY = 1.2;
         this.§_-I1r§.addChild(_loc1_);
         var _loc2_:Array = [§_-at§.§_-I6§,§_-at§.§_-D18§,§_-at§.§_-e2a§,§_-at§.§_-92b§,§_-at§.§_-U1s§,§_-at§.§_-j1i§];
         var _loc3_:Array = [_loc1_.buttonSunnyValley,_loc1_.buttonSwamp,_loc1_.buttonHard,_loc1_.buttonDesert,_loc1_.buttonStorm,_loc1_.buttonAnomal];
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc8_ = §_-FK§[_loc4_];
            (_loc3_[_loc4_] as MovieClip).mouseChildren = false;
            this.§_-02e§(_loc3_[_loc4_],this.§_-p1g§,_loc2_[_loc4_],!§_-Zy§.§_-e2k§);
            this.§_-o1O§[_loc2_[_loc4_]] = this.§_-It§(_loc3_[_loc4_].x + _loc8_["offsetX"],_loc3_[_loc4_].y + _loc8_["offsetY"],_loc8_["rotate"]);
            _loc9_ = this.§_-o1O§[_loc2_[_loc4_]]["image"];
            _loc1_.addChild(_loc9_);
            _loc9_.scaleX = 1 / _loc9_.parent.scaleX;
            _loc9_.scaleY = 1 / _loc9_.parent.scaleY;
            _loc4_++;
         }
         var _loc5_:SmallPlanet = new SmallPlanet();
         _loc5_.x = 635;
         _loc5_.y = 350;
         _loc5_.scaleX = _loc5_.scaleY = 0.4;
         this.§_-I1r§.addChild(_loc5_);
         _loc3_ = [_loc5_.buttonBattle,_loc5_.buttonWild,_loc5_.buttonOlympic];
         _loc2_ = [§_-at§.§_-N2g§,§_-at§.§_-G1K§,§_-at§.§_-nq§];
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc8_ = §_-o2L§[_loc4_];
            (_loc3_[_loc4_] as MovieClip).mouseChildren = false;
            this.§_-02e§(_loc3_[_loc4_],this.§_-p1g§,_loc2_[_loc4_],!§_-Zy§.§_-e2k§);
            this.§_-o1O§[_loc2_[_loc4_]] = this.§_-It§(_loc3_[_loc4_].x + _loc8_["offsetX"],_loc3_[_loc4_].y + _loc8_["offsetY"],_loc8_["rotate"]);
            _loc9_ = this.§_-o1O§[_loc2_[_loc4_]]["image"];
            _loc5_.addChild(_loc9_);
            _loc9_.scaleX = 1 / _loc9_.parent.scaleX;
            _loc9_.scaleY = 1 / _loc9_.parent.scaleY;
            _loc4_++;
         }
         var _loc6_:MovieClip = new (§_-Zy§.§_-BI§ ? SchoolPlanetRu : SchoolPlanetEn)();
         _loc6_.x = 105;
         _loc6_.y = 420;
         _loc6_.scaleX = _loc6_.scaleY = 0.7;
         this.§_-I1r§.addChild(_loc6_);
         this.§_-02e§(_loc6_,this.§_-p1g§,§_-at§.§_-Uf§,!§_-Zy§.§_-e2k§);
         var _loc7_:EditorPlanet = new EditorPlanet();
         _loc7_.x = 805;
         _loc7_.y = 150;
         _loc7_.scaleX = _loc7_.scaleY = 0.5;
         this.§_-I1r§.addChild(_loc7_);
         this.§_-02e§(_loc7_,this.§_-p1g§,§_-at§.§_-V1H§,!§_-Zy§.§_-e2k§);
         this.§_-H1e§ = new §_-n0§(this.§_-535§,this.§_-I1r§,§_-Zy§.§_-e2k§ ? this.§_-D1§ : null,§_-Zy§.§_-e2k§ ? this.§_-Nh§ : null);
         this.§_-c2s§(this.§_-Nh§);
      }
      
      private function §_-02e§(param1:MovieClip, param2:Function, param3:int = -1, param4:Boolean = true) : void
      {
         param1.buttonMode = true;
         param1.addEventListener(MouseEvent.ROLL_OVER,this.§_-H11§);
         param1.addEventListener(MouseEvent.ROLL_OUT,this.§_-T1o§);
         §_-12w§.§_-b1b§(param1);
         if(param4 && param2 != null)
         {
            param1.addEventListener(MouseEvent.CLICK,param2);
         }
         if(param3 == -1)
         {
            return;
         }
         if(param3 == §_-at§.§_-nq§)
         {
            param1.visible = §_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§ | §_-33I§.§_-AJ§) || Game.self.level >= 200;
         }
         param1["id"] = param3;
         param1.stop();
         this.§_-535§[param3] = param1;
         var _loc5_:ImageLocationLock = new ImageLocationLock();
         _loc5_.x = param1.x + (param3 == §_-at§.§_-e2a§ ? -15 : (param3 == §_-at§.§_-N2g§ ? 40 : (param3 == §_-at§.§_-nq§ ? -15 : 0)));
         _loc5_.y = param1.y + (param3 == §_-at§.§_-N2g§ ? 40 : (param3 == §_-at§.§_-G1K§ ? -15 : (param3 == §_-at§.§_-nq§ ? -120 : 0)));
         if(param3 == §_-at§.§_-U1s§)
         {
            _loc5_.x = param1.x;
            _loc5_.y = param1.y;
         }
         _loc5_.scaleX = 1 / param1.parent.scaleX;
         _loc5_.scaleY = 1 / param1.parent.scaleY;
         _loc5_.mouseEnabled = false;
         param1.parent.addChild(_loc5_);
         this.§_-R2B§[param3] = _loc5_;
      }
      
      private function §_-H11§(param1:MouseEvent) : void
      {
         var _loc2_:int = int(param1.currentTarget["id"]);
         if(Boolean(_loc2_) && this.§_-Nh§.indexOf(_loc2_) == -1)
         {
            return;
         }
         param1.target.filters = §_-S1S§;
         §_-k12§.§_-b2X§(param1.target as MovieClip);
         (param1.target as MovieClip).gotoAndPlay(0);
         this.§_-X1c§ = GameSounds.play(§_-RH§.§_-i1v§[_loc2_] || §_-RH§.§_-Q1z§,true);
      }
      
      private function §_-T1o§(param1:MouseEvent) : void
      {
         var _loc2_:int = int(param1.currentTarget["id"]);
         if(Boolean(_loc2_) && this.§_-Nh§.indexOf(_loc2_) == -1)
         {
            return;
         }
         param1.target.filters = null;
         §_-k12§.stopAll(param1.target as MovieClip,0);
         (param1.target as MovieClip).gotoAndStop(0);
         GameSounds.stop(this.§_-X1c§);
      }
      
      private function §_-p1g§(param1:MouseEvent) : void
      {
         this.§_-D1§(param1.currentTarget["id"]);
      }
      
      private function §_-It§(param1:int, param2:int, param3:int = 0) : Object
      {
         var _loc4_:Sprite = new Sprite();
         _loc4_.x = param1;
         _loc4_.y = param2;
         var _loc5_:FriendsOnlineImage = new FriendsOnlineImage();
         _loc5_.rotation = param3;
         _loc4_.addChild(_loc5_);
         new §_-kr§(_loc5_,gls("Количество твоих друзей на локации"));
         var _loc6_:§_-i5§ = new §_-i5§("",0,0,§_-M2x§);
         _loc6_.filters = §_-I1y§;
         _loc6_.mouseEnabled = false;
         _loc6_.x = -(_loc6_.textWidth * 0.5) - 2;
         _loc6_.y = -(_loc6_.textHeight * 0.5) - 2;
         _loc4_.addChild(_loc6_);
         _loc4_.visible = false;
         return {
            "image":_loc4_,
            "field":_loc6_
         };
      }
      
      private function §_-c2s§(param1:Vector.<int>) : void
      {
         var _loc2_:String = null;
         var _loc3_:Boolean = false;
         var _loc4_:MovieClip = null;
         this.§_-Nh§ = param1;
         if(this.§_-H1e§ != null)
         {
            this.§_-H1e§.§_-bH§(this.§_-Nh§);
         }
         for(_loc2_ in this.§_-535§)
         {
            _loc3_ = this.§_-Nh§.indexOf(int(_loc2_)) != -1;
            _loc4_ = this.§_-535§[_loc2_];
            _loc4_.filters = _loc3_ ? [] : §_-S1Z§;
            this.§_-R2B§[_loc2_].visible = _loc4_.visible && !_loc3_;
         }
      }
      
      private function §_-Z2b§(param1:Array) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:§_-i5§ = null;
         for each(_loc2_ in this.§_-o1O§)
         {
            _loc2_["image"].visible = false;
         }
         _loc3_ = 0;
         _loc4_ = int(param1.length);
         while(_loc3_ < _loc4_)
         {
            if(param1[_loc3_] in this.§_-o1O§)
            {
               this.§_-o1O§[param1[_loc3_]]["image"].visible = true;
               this.§_-o1O§[param1[_loc3_]]["count"] = param1[_loc3_ + 1] >= 0 ? param1[_loc3_ + 1] : param1[_loc3_ + 1] + 256;
               _loc5_ = this.§_-o1O§[param1[_loc3_]]["field"];
               _loc5_.text = this.§_-o1O§[param1[_loc3_]]["count"];
               _loc5_.x = -(_loc5_.textWidth * 0.5) - 2;
               _loc5_.y = -(_loc5_.textHeight * 0.5) - 2;
            }
            _loc3_ += 2;
         }
      }
      
      private function §_-D1§(param1:int) : void
      {
         var locationId:int = param1;
         if(§_-Wd§.§_-xR§)
         {
            return;
         }
         GameSounds.play(§_-RH§.§_-i1v§[locationId] || §_-RH§.§_-K10§,true);
         §_-U2d§.load(function():void
         {
            startGame(locationId);
         },false,true);
      }
      
      private function startGame(param1:int) : void
      {
         if(this.§_-Nh§.indexOf(param1) == -1)
         {
            return;
         }
         if(!§_-hO§.§_-w2n§(param1))
         {
            §_-TB§.show(param1);
            return;
         }
         if(param1 == §_-at§.§_-N2g§ && !§_-r12§.§_-FS§(§_-n2E§.§_-A3F§))
         {
            §_-S2E§.type = §_-S2E§.§_-K1w§;
            §_-t2c§.show("School");
            return;
         }
         switch(param1)
         {
            case §_-at§.§_-Uf§:
               §_-S2E§.type = §_-r12§.§_-FS§(§_-n2E§.§_-y1i§) ? §_-S2E§.§_-Z2N§ : §_-S2E§.§_-y3§;
               §_-t2c§.show("School");
               break;
            case §_-at§.§_-V1H§:
               §_-t2c§.show("Edit");
               break;
            default:
               if(§_-U2d§.loaded)
               {
                  §_-aW§.instance.close();
               }
               §_-u24§.start(param1);
         }
      }
      
      private function §_-R2A§(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         GameSounds.play(§_-RH§.§_-K10§,true);
         §_-U2d§.load(function():void
         {
            if(§_-Ac§.§_-nG§)
            {
               §_-U2u§.show();
            }
            else
            {
               §_-Dn§.show();
            }
         });
      }
      
      private function §_-E1Z§() : void
      {
         this.§_-R1F§ = new Sprite();
         this.§_-L2D§ = new ButtonQuestShow();
         this.§_-L2D§.x = 10;
         this.§_-L2D§.scaleX = this.§_-L2D§.scaleY = 0.85;
         this.§_-L2D§.addEventListener(MouseEvent.CLICK,this.§_-R2A§);
         this.§_-R1F§.addChild(this.§_-L2D§);
         new §_-kr§(this.§_-L2D§,gls("Миссии"));
         NotificationManager.instance.§_-a1K§(NotificationManager.DAILY_QUEST,new §_-O2q§(this.§_-L2D§,35,35));
         §_-Ac§.§_-63M§.x = 60;
         §_-Ac§.§_-63M§.y = 5;
         this.§_-R1F§.addChild(§_-Ac§.§_-63M§);
         §_-Ac§.§_-Bi§.x = 175;
         §_-Ac§.§_-Bi§.y = 20;
         this.§_-R1F§.addChild(§_-Ac§.§_-Bi§);
         this.§_-N1d§ = new ButtonFriendGiftsShow();
         this.§_-N1d§.x = 10;
         this.§_-N1d§.y = 60;
         this.§_-N1d§.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            var e:MouseEvent = param1;
            GameSounds.play(§_-RH§.§_-K10§,true);
            §_-U2d§.load(function():void
            {
               §_-qC§.show();
            });
         });
         this.§_-R1F§.addChild(this.§_-N1d§);
         new §_-kr§(this.§_-N1d§,gls("Подарки друзьям"));
         this.§_-UO§ = new (§_-Zy§.§_-BI§ ? ButtonViralityQuestsShowRu : ButtonViralityQuestsShowEn)();
         this.§_-UO§.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            GameSounds.play(§_-RH§.§_-K10§,true);
            §_-710§.show();
         });
         this.§_-UO§.x = 38;
         this.§_-UO§.y = 26;
         this.§_-R1F§.addChild(this.§_-UO§);
         new §_-kr§(this.§_-UO§,§_-Q2l§.§_-M1U§.toString() + " " + gls("монет бесплатно"));
         this.§_-B1y§ = new Sprite();
         this.§_-B1y§.x = 822;
         this.§_-B1y§.y = 123;
         this.§_-R1F§.addChild(this.§_-B1y§);
         this.§_-R1F§.y = 100;
         addChild(this.§_-R1F§);
      }
      
      private function §_-eV§(param1:int) : void
      {
         this.§_-c2s§(§_-at§.§_-vv§(param1));
         this.§_-m1x§();
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var _loc2_:Array = null;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         switch(param1.type)
         {
            case §_-s2l§.§_-W1l§:
               _loc2_ = param1[0];
               this.§_-H1e§.§_-y1W§(_loc2_);
               if(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-42W§ | §_-33I§.§_-AJ§))
               {
                  _loc3_ = 0;
                  for each(_loc4_ in _loc2_)
                  {
                     _loc3_ += _loc4_;
                  }
                  §_-N1t§.§_-b25§(_loc3_);
               }
               Connection.§_-e2T§(§_-u1O§.§_-13I§);
               break;
            case §_-s2l§.§_-13I§:
               this.§_-Z2b§(param1[0]);
         }
      }
      
      private function §_-m1x§() : void
      {
         this.§_-B1y§.y = 145;
         this.§_-N1d§.visible = §_-LZ§.§_-mA§ >= §_-XW§.§_-I1V§ && §_-i2a§.§_-51j§ != null && (§_-i2a§.§_-51j§.length == 0 || §_-i2a§.§_-51j§.length > §_-qC§.§_-Z12§.length);
         this.§_-N1d§.y = this.§_-L2D§.y + (this.§_-L2D§.visible ? 60 : 0);
         this.§_-UO§.y = this.§_-N1d§.y + (this.§_-N1d§.visible ? 85 : 27);
         this.§_-UO§.visible = §_-Q2l§.§_-Xe§ && !§_-Q2l§.§_-A34§;
      }
      
      private function §_-w2y§(param1:Event = null) : void
      {
         var _loc2_:Number = Game.starling.stage.stageWidth;
         var _loc3_:Number = Game.starling.stage.stageHeight;
         this.bg.scaleX = this.bg.scaleY = _loc3_ / §_-Zy§.§_-02T§;
         if(_loc2_ > this.bg.width)
         {
            this.bg.width = _loc2_ * 1.01;
         }
         this.§_-I1r§.x = (_loc2_ - this.§_-I1r§.width) * 0.5;
         this.§_-I1r§.y = (_loc3_ - this.§_-I1r§.height) * 0.5 - 25;
      }
   }
}

