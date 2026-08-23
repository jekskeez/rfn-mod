package §_-T2y§
{
   import §_-68§.§_-EI§;
   import §_-D2e§.§_-z1R§;
   import §_-I10§.NotificationManager;
   import §_-I10§.§_-3U§;
   import §_-I10§.§_-Bg§;
   import §_-I10§.§_-Bm§;
   import §_-I10§.§_-My§;
   import §_-I10§.§_-Q2v§;
   import §_-I10§.§_-S16§;
   import §_-I10§.§_-Z1F§;
   import §_-I10§.§_-d2x§;
   import §_-e1G§.§_-Hb§;
   import §_-k1c§.§_-41X§;
   import §_-k1c§.§_-82v§;
   import §_-k1c§.§_-T2m§;
   import §_-k1c§.§_-t1I§;
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
   import protocol.§_-S2I§;
   import protocol.§_-T2o§;
   import protocol.§_-h2B§;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   import utils.§_-63K§;
   import utils.§_-N1w§;
   import utils.§_-c10§;
   import utils.§_-vS§;
   import views.§_-E8§;
   import views.§_-Vm§;
   import views.§_-lb§;
   
   public class §_-5K§ extends Screen
   {
      
      private static const §_-En§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,14,0);
      
      private static const §_-z1q§:Array = [new GlowFilter(15065556,1,2,2,8,BitmapFilterQuality.MEDIUM)];
      
      private static const §_-R2§:Array = [new GlowFilter(16777164,1,8,8,2,BitmapFilterQuality.MEDIUM)];
      
      private static const §_-D2h§:Array = [new ColorMatrixFilter([0.3,0,0,0,0,0,0.3,0,0,0,0,0,0.3,0,0,0,0,0,1,0])];
      
      private static const §_-N2P§:Array = [{
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
      
      private static const §_-W2Z§:Array = [{
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
      
      private static var _instance:§_-5K§ = null;
      
      private var §_-g10§:Vector.<int> = new Vector.<int>(0);
      
      private var §_-v1Q§:Object = {};
      
      private var §_-Ks§:Object = {};
      
      private var §_-I1Z§:Object = {};
      
      private var bg:Sprite = null;
      
      private var §_-s2§:Sprite = null;
      
      private var §_-T§:§_-31K§ = null;
      
      private var §_-tb§:SoundChannel = null;
      
      private var §_-KO§:Sprite = null;
      
      private var §_-A1o§:SimpleButton = null;
      
      private var §_-wF§:SimpleButton = null;
      
      private var §_-62n§:SimpleButton = null;
      
      private var §_-B2S§:Sprite = null;
      
      public function §_-5K§()
      {
         super();
         this.init();
         _instance = this;
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-B3k§,§_-S2I§.§_-5§]);
      }
      
      public static function §_-a2t§(param1:int) : void
      {
         _instance.§_-a2t§(param1);
      }
      
      public static function §_-b1W§() : void
      {
         if(_instance == null)
         {
            return;
         }
         _instance.§_-b1W§();
      }
      
      public static function set §_-2G§(param1:Boolean) : void
      {
         if(!_instance)
         {
            return;
         }
         if(param1)
         {
            _instance.addChild(_instance.§_-B2S§);
         }
         else if(_instance.contains(_instance.§_-B2S§))
         {
            _instance.removeChild(_instance.§_-B2S§);
         }
      }
      
      override public function show() : void
      {
         super.show();
         this.§_-b1W§();
         this.§_-5W§();
         §_-vS§.§_-82W§();
      }
      
      override public function hide() : void
      {
         super.hide();
         this.§_-T§.§_-B1T§();
      }
      
      private function init() : void
      {
         this.§_-w2q§();
         this.§_-D2s§();
         this.§_-b1W§();
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-5W§);
      }
      
      private function §_-w2q§() : void
      {
         var _loc8_:Object = null;
         var _loc9_:Sprite = null;
         this.bg = new BackgroundScreenLocation();
         this.bg.cacheAsBitmap = true;
         addChild(this.bg);
         this.§_-s2§ = new Sprite();
         addChild(this.§_-s2§);
         var _loc1_:MainPlanet = new MainPlanet();
         _loc1_.x = 137;
         _loc1_.scaleX = _loc1_.scaleY = 1.2;
         this.§_-s2§.addChild(_loc1_);
         var _loc2_:Array = [§_-q1p§.§_-C25§,§_-q1p§.§_-sL§,§_-q1p§.§_-A3z§,§_-q1p§.§_-P4§,§_-q1p§.§_-Q1s§,§_-q1p§.§_-u2u§];
         var _loc3_:Array = [_loc1_.buttonSunnyValley,_loc1_.buttonSwamp,_loc1_.buttonHard,_loc1_.buttonDesert,_loc1_.buttonStorm,_loc1_.buttonAnomal];
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc8_ = §_-N2P§[_loc4_];
            (_loc3_[_loc4_] as MovieClip).mouseChildren = false;
            this.§_-U1u§(_loc3_[_loc4_],this.§_-D2x§,_loc2_[_loc4_],!§_-a9§.§_-O1z§);
            this.§_-I1Z§[_loc2_[_loc4_]] = this.§_-K20§(_loc3_[_loc4_].x + _loc8_["offsetX"],_loc3_[_loc4_].y + _loc8_["offsetY"],_loc8_["rotate"]);
            _loc9_ = this.§_-I1Z§[_loc2_[_loc4_]]["image"];
            _loc1_.addChild(_loc9_);
            _loc9_.scaleX = 1 / _loc9_.parent.scaleX;
            _loc9_.scaleY = 1 / _loc9_.parent.scaleY;
            _loc4_++;
         }
         var _loc5_:SmallPlanet = new SmallPlanet();
         _loc5_.x = 635;
         _loc5_.y = 350;
         _loc5_.scaleX = _loc5_.scaleY = 0.4;
         this.§_-s2§.addChild(_loc5_);
         _loc3_ = [_loc5_.buttonBattle,_loc5_.buttonWild,_loc5_.buttonOlympic];
         _loc2_ = [§_-q1p§.§_-M1m§,§_-q1p§.§_-k2B§,§_-q1p§.§_-427§];
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc8_ = §_-W2Z§[_loc4_];
            (_loc3_[_loc4_] as MovieClip).mouseChildren = false;
            this.§_-U1u§(_loc3_[_loc4_],this.§_-D2x§,_loc2_[_loc4_],!§_-a9§.§_-O1z§);
            this.§_-I1Z§[_loc2_[_loc4_]] = this.§_-K20§(_loc3_[_loc4_].x + _loc8_["offsetX"],_loc3_[_loc4_].y + _loc8_["offsetY"],_loc8_["rotate"]);
            _loc9_ = this.§_-I1Z§[_loc2_[_loc4_]]["image"];
            _loc5_.addChild(_loc9_);
            _loc9_.scaleX = 1 / _loc9_.parent.scaleX;
            _loc9_.scaleY = 1 / _loc9_.parent.scaleY;
            _loc4_++;
         }
         var _loc6_:MovieClip = new (§_-a9§.§_-sc§ ? SchoolPlanetRu : SchoolPlanetEn)();
         _loc6_.x = 105;
         _loc6_.y = 420;
         _loc6_.scaleX = _loc6_.scaleY = 0.7;
         this.§_-s2§.addChild(_loc6_);
         this.§_-U1u§(_loc6_,this.§_-D2x§,§_-q1p§.§_-G1z§,!§_-a9§.§_-O1z§);
         var _loc7_:EditorPlanet = new EditorPlanet();
         _loc7_.x = 805;
         _loc7_.y = 150;
         _loc7_.scaleX = _loc7_.scaleY = 0.5;
         this.§_-s2§.addChild(_loc7_);
         this.§_-U1u§(_loc7_,this.§_-D2x§,§_-q1p§.§_-2Z§,!§_-a9§.§_-O1z§);
         this.§_-T§ = new §_-31K§(this.§_-v1Q§,this.§_-s2§,§_-a9§.§_-O1z§ ? this.§_-93s§ : null,§_-a9§.§_-O1z§ ? this.§_-g10§ : null);
         this.§_-QW§(this.§_-g10§);
      }
      
      private function §_-U1u§(param1:MovieClip, param2:Function, param3:int = -1, param4:Boolean = true) : void
      {
         param1.buttonMode = true;
         param1.addEventListener(MouseEvent.ROLL_OVER,this.§_-yM§);
         param1.addEventListener(MouseEvent.ROLL_OUT,this.§_-E2s§);
         §_-N1w§.§_-s2c§(param1);
         if(param4 && param2 != null)
         {
            param1.addEventListener(MouseEvent.CLICK,param2);
         }
         if(param3 == -1)
         {
            return;
         }
         if(param3 == §_-q1p§.§_-427§)
         {
            param1.visible = §_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§ | §_-c10§.§_-639§) || Game.self.level >= 200;
         }
         param1["id"] = param3;
         param1.stop();
         this.§_-v1Q§[param3] = param1;
         var _loc5_:ImageLocationLock = new ImageLocationLock();
         _loc5_.x = param1.x + (param3 == §_-q1p§.§_-A3z§ ? -15 : (param3 == §_-q1p§.§_-M1m§ ? 40 : (param3 == §_-q1p§.§_-427§ ? -15 : 0)));
         _loc5_.y = param1.y + (param3 == §_-q1p§.§_-M1m§ ? 40 : (param3 == §_-q1p§.§_-k2B§ ? -15 : (param3 == §_-q1p§.§_-427§ ? -120 : 0)));
         if(param3 == §_-q1p§.§_-Q1s§)
         {
            _loc5_.x = param1.x;
            _loc5_.y = param1.y;
         }
         _loc5_.scaleX = 1 / param1.parent.scaleX;
         _loc5_.scaleY = 1 / param1.parent.scaleY;
         _loc5_.mouseEnabled = false;
         param1.parent.addChild(_loc5_);
         this.§_-Ks§[param3] = _loc5_;
      }
      
      private function §_-yM§(param1:MouseEvent) : void
      {
         var _loc2_:int = int(param1.currentTarget["id"]);
         if(Boolean(_loc2_) && this.§_-g10§.indexOf(_loc2_) == -1)
         {
            return;
         }
         param1.target.filters = §_-R2§;
         §_-63K§.§_-pt§(param1.target as MovieClip);
         (param1.target as MovieClip).gotoAndPlay(0);
         this.§_-tb§ = GameSounds.play(§_-43Z§.§_-T23§[_loc2_] || §_-43Z§.§_-2E§,true);
      }
      
      private function §_-E2s§(param1:MouseEvent) : void
      {
         var _loc2_:int = int(param1.currentTarget["id"]);
         if(Boolean(_loc2_) && this.§_-g10§.indexOf(_loc2_) == -1)
         {
            return;
         }
         param1.target.filters = null;
         §_-63K§.stopAll(param1.target as MovieClip,0);
         (param1.target as MovieClip).gotoAndStop(0);
         GameSounds.stop(this.§_-tb§);
      }
      
      private function §_-D2x§(param1:MouseEvent) : void
      {
         this.§_-93s§(param1.currentTarget["id"]);
      }
      
      private function §_-K20§(param1:int, param2:int, param3:int = 0) : Object
      {
         var _loc4_:Sprite = new Sprite();
         _loc4_.x = param1;
         _loc4_.y = param2;
         var _loc5_:FriendsOnlineImage = new FriendsOnlineImage();
         _loc5_.rotation = param3;
         _loc4_.addChild(_loc5_);
         new §_-Hb§(_loc5_,gls("Количество твоих друзей на локации"));
         var _loc6_:§_-22V§ = new §_-22V§("",0,0,§_-En§);
         _loc6_.filters = §_-z1q§;
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
      
      private function §_-QW§(param1:Vector.<int>) : void
      {
         var _loc2_:String = null;
         var _loc3_:Boolean = false;
         var _loc4_:MovieClip = null;
         this.§_-g10§ = param1;
         if(this.§_-T§ != null)
         {
            this.§_-T§.§_-65§(this.§_-g10§);
         }
         for(_loc2_ in this.§_-v1Q§)
         {
            _loc3_ = this.§_-g10§.indexOf(int(_loc2_)) != -1;
            _loc4_ = this.§_-v1Q§[_loc2_];
            _loc4_.filters = _loc3_ ? [] : §_-D2h§;
            this.§_-Ks§[_loc2_].visible = _loc4_.visible && !_loc3_;
         }
      }
      
      private function §_-61R§(param1:Array) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:§_-22V§ = null;
         for each(_loc2_ in this.§_-I1Z§)
         {
            _loc2_["image"].visible = false;
         }
         _loc3_ = 0;
         _loc4_ = int(param1.length);
         while(_loc3_ < _loc4_)
         {
            if(param1[_loc3_] in this.§_-I1Z§)
            {
               this.§_-I1Z§[param1[_loc3_]]["image"].visible = true;
               this.§_-I1Z§[param1[_loc3_]]["count"] = param1[_loc3_ + 1] >= 0 ? param1[_loc3_ + 1] : param1[_loc3_ + 1] + 256;
               _loc5_ = this.§_-I1Z§[param1[_loc3_]]["field"];
               _loc5_.text = this.§_-I1Z§[param1[_loc3_]]["count"];
               _loc5_.x = -(_loc5_.textWidth * 0.5) - 2;
               _loc5_.y = -(_loc5_.textHeight * 0.5) - 2;
            }
            _loc3_ += 2;
         }
      }
      
      private function §_-93s§(param1:int) : void
      {
         var locationId:int = param1;
         if(§_-S16§.§_-j1Q§)
         {
            return;
         }
         GameSounds.play(§_-43Z§.§_-T23§[locationId] || §_-43Z§.§_-o1e§,true);
         §_-EI§.load(function():void
         {
            startGame(locationId);
         },false,true);
      }
      
      private function startGame(param1:int) : void
      {
         if(this.§_-g10§.indexOf(param1) == -1)
         {
            return;
         }
         if(!§_-Z1F§.§_-92p§(param1))
         {
            §_-t1I§.show(param1);
            return;
         }
         if(param1 == §_-q1p§.§_-M1m§ && !§_-Bm§.§_-2S§(§_-T2o§.§_-mM§))
         {
            §_-F29§.type = §_-F29§.§_-fY§;
            §_-71o§.show("School");
            return;
         }
         switch(param1)
         {
            case §_-q1p§.§_-G1z§:
               §_-F29§.type = §_-Bm§.§_-2S§(§_-T2o§.§_-Q2R§) ? §_-F29§.§_-S2i§ : §_-F29§.§_-q1M§;
               §_-71o§.show("School");
               break;
            case §_-q1p§.§_-2Z§:
               §_-71o§.show("Edit");
               break;
            default:
               if(§_-EI§.loaded)
               {
                  §_-Vm§.instance.close();
               }
               §_-92z§.start(param1);
         }
      }
      
      private function §_-Pk§(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         GameSounds.play(§_-43Z§.§_-o1e§,true);
         §_-EI§.load(function():void
         {
            if(§_-Q2v§.§_-U2K§)
            {
               §_-z1R§.show();
            }
            else
            {
               §_-82v§.show();
            }
         });
      }
      
      private function §_-D2s§() : void
      {
         this.§_-B2S§ = new Sprite();
         this.§_-A1o§ = new ButtonQuestShow();
         this.§_-A1o§.x = 10;
         this.§_-A1o§.scaleX = this.§_-A1o§.scaleY = 0.85;
         this.§_-A1o§.addEventListener(MouseEvent.CLICK,this.§_-Pk§);
         this.§_-B2S§.addChild(this.§_-A1o§);
         new §_-Hb§(this.§_-A1o§,gls("Миссии"));
         NotificationManager.instance.§_-P2Y§(NotificationManager.DAILY_QUEST,new §_-E8§(this.§_-A1o§,35,35));
         §_-Q2v§.§_-u2X§.x = 60;
         §_-Q2v§.§_-u2X§.y = 5;
         this.§_-B2S§.addChild(§_-Q2v§.§_-u2X§);
         §_-Q2v§.§_-Tv§.x = 175;
         §_-Q2v§.§_-Tv§.y = 20;
         this.§_-B2S§.addChild(§_-Q2v§.§_-Tv§);
         this.§_-62n§ = new ButtonFriendGiftsShow();
         this.§_-62n§.x = 10;
         this.§_-62n§.y = 60;
         this.§_-62n§.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            var e:MouseEvent = param1;
            GameSounds.play(§_-43Z§.§_-o1e§,true);
            §_-EI§.load(function():void
            {
               §_-41X§.show();
            });
         });
         this.§_-B2S§.addChild(this.§_-62n§);
         new §_-Hb§(this.§_-62n§,gls("Подарки друзьям"));
         this.§_-wF§ = new (§_-a9§.§_-sc§ ? ButtonViralityQuestsShowRu : ButtonViralityQuestsShowEn)();
         this.§_-wF§.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            GameSounds.play(§_-43Z§.§_-o1e§,true);
            §_-T2m§.show();
         });
         this.§_-wF§.x = 38;
         this.§_-wF§.y = 26;
         this.§_-B2S§.addChild(this.§_-wF§);
         new §_-Hb§(this.§_-wF§,§_-3U§.§_-113§.toString() + " " + gls("монет бесплатно"));
         this.§_-KO§ = new Sprite();
         this.§_-KO§.x = 822;
         this.§_-KO§.y = 123;
         this.§_-B2S§.addChild(this.§_-KO§);
         this.§_-B2S§.y = 100;
         addChild(this.§_-B2S§);
      }
      
      private function §_-a2t§(param1:int) : void
      {
         this.§_-QW§(§_-q1p§.§_-N16§(param1));
         this.§_-b1W§();
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         var _loc2_:Array = null;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         switch(param1.type)
         {
            case §_-S2I§.§_-B3k§:
               _loc2_ = param1[0];
               this.§_-T§.§_-4K§(_loc2_);
               if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-MR§ | §_-c10§.§_-639§))
               {
                  _loc3_ = 0;
                  for each(_loc4_ in _loc2_)
                  {
                     _loc3_ += _loc4_;
                  }
                  §_-lb§.§_-B2m§(_loc3_);
               }
               Connection.§_-Li§(§_-h2B§.§_-5§);
               break;
            case §_-S2I§.§_-5§:
               this.§_-61R§(param1[0]);
         }
      }
      
      private function §_-b1W§() : void
      {
         this.§_-KO§.y = 145;
         this.§_-62n§.visible = §_-d2x§.§_-z2o§ >= §_-My§.§_-U1R§ && §_-Bg§.§_-I2L§ != null && (§_-Bg§.§_-I2L§.length == 0 || §_-Bg§.§_-I2L§.length > §_-41X§.§_-Lh§.length);
         this.§_-62n§.y = this.§_-A1o§.y + (this.§_-A1o§.visible ? 60 : 0);
         this.§_-wF§.y = this.§_-62n§.y + (this.§_-62n§.visible ? 85 : 27);
         this.§_-wF§.visible = §_-3U§.§_-LM§ && !§_-3U§.§_-IY§;
      }
      
      private function §_-5W§(param1:Event = null) : void
      {
         var _loc2_:Number = Game.starling.stage.stageWidth;
         var _loc3_:Number = Game.starling.stage.stageHeight;
         this.bg.scaleX = this.bg.scaleY = _loc3_ / §_-a9§.§_-31m§;
         if(_loc2_ > this.bg.width)
         {
            this.bg.width = _loc2_ * 1.01;
         }
         this.§_-s2§.x = (_loc2_ - this.§_-s2§.width) * 0.5;
         this.§_-s2§.y = (_loc3_ - this.§_-s2§.height) * 0.5 - 25;
      }
   }
}

