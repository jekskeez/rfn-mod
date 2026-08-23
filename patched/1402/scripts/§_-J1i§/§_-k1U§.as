package §_-J1i§
{
   import §_-c2C§.§_-S2E§;
   import §_-c2C§.§_-fx§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-u24§;
   import buttons.§_-K2G§;
   import events.ScreenEvent;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import sounds.GameSounds;
   import utils.§_-B1d§;
   import views.§_-H2O§;
   
   public class §_-k1U§ extends Sprite
   {
      
      private static const §_-IO§:int = -1;
      
      private static const §_-x1k§:int = 0;
      
      private static const §_-V2B§:int = 1;
      
      private static const §_-7C§:int = 2;
      
      private static var _instance:§_-k1U§;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 14px;","color: #000000;","line-height: 1.5;","}",".count {","font-size: 13px;","color: #000000;","}","a {","text-decoration: underline;","}"].join("\n");
      
      private var §_-W2d§:§_-i5§;
      
      private var §_-m1U§:ImageClock;
      
      private var §_-8T§:§_-H2O§;
      
      private var §_-BX§:Array = [];
      
      private var §_-56§:Sprite = null;
      
      private var §_-92T§:Sprite = null;
      
      public function §_-k1U§()
      {
         _instance = this;
         super();
         this.visible = false;
         this.init();
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-V1b§],1);
         §_-t2c§.instance.addEventListener(ScreenEvent.SHOW,this.§_-T14§);
      }
      
      public static function show() : void
      {
         §_-22v§();
         _instance.visible = true;
      }
      
      public static function hide() : void
      {
         _instance.visible = false;
      }
      
      public static function clear() : void
      {
         _instance.§_-W2d§.text = "";
         _instance.§_-m1U§.visible = false;
         _instance.§_-8T§.hide();
      }
      
      public static function §_-Z1i§(param1:int) : void
      {
         _instance.§_-W2d§.text = String(§_-B1d§.§_-z2d§(param1));
         _instance.§_-W2d§.visible = true;
         _instance.§_-m1U§.visible = true;
      }
      
      public static function getTime() : String
      {
         return _instance.§_-W2d§.text;
      }
      
      public static function §_-V2p§() : int
      {
         return int(_instance.§_-W2d§.text.split(":")[1]) + int(_instance.§_-W2d§.text.split(":")[0]) * 60;
      }
      
      public static function §_-yA§(param1:Array) : void
      {
         _instance.§_-8T§.§_-yA§(param1.length);
      }
      
      public static function §_-RB§(param1:Array, param2:Array) : void
      {
         _instance.§_-8T§.§_-RB§(param1,param2);
      }
      
      public static function §_-W2T§(param1:Array) : void
      {
         _instance.§_-8T§.§_-L2k§.§_-o2y§(param1);
      }
      
      public static function §_-a1r§(param1:int) : void
      {
         _instance.§_-8T§.§_-L2k§.§_-a1r§(param1);
      }
      
      public static function §_-z1t§(param1:int) : void
      {
         _instance.§_-8T§.show(param1 == §_-at§.§_-N2g§);
      }
      
      public static function §_-22v§() : void
      {
         if(!_instance)
         {
            return;
         }
         _instance.§_-56§.x = (Game.starling.stage.stageWidth - 110) * 0.5;
         _instance.§_-92T§.x = Game.starling.stage.stageWidth - _instance.§_-92T§.width;
      }
      
      public static function set §_-42x§(param1:Boolean) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:§_-K2G§ = null;
         for each(_loc2_ in _instance.§_-BX§)
         {
            _loc3_ = _loc2_["object"] as §_-K2G§;
            if(_loc3_)
            {
               _loc3_.enabled = param1;
            }
         }
      }
      
      public static function set §_-o21§(param1:Boolean) : void
      {
         _instance.§_-56§.visible = param1;
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-aD§);
         addChild(new HeaderGameLeft());
         this.§_-56§ = new Sprite();
         this.§_-56§.x = 395;
         this.§_-56§.addChild(new HeaderGameMiddle());
         addChild(this.§_-56§);
         this.§_-92T§ = new Sprite();
         this.§_-92T§.x = (Game.starling.stage.stageWidth - 157) * 0.5;
         this.§_-92T§.addChild(new HeaderGameRight());
         addChild(this.§_-92T§);
         this.§_-W2d§ = new §_-i5§("",25,13,new TextFormat(null,13,16777215,true));
         this.§_-56§.addChild(this.§_-W2d§);
         this.§_-BX§.push({
            "object":this.§_-W2d§,
            "types":[§_-x1k§]
         });
         this.§_-m1U§ = new ImageClock();
         this.§_-m1U§.x = 7;
         this.§_-m1U§.y = 13;
         this.§_-m1U§.cacheAsBitmap = true;
         this.§_-56§.addChild(this.§_-m1U§);
         this.§_-BX§.push({
            "object":this.§_-m1U§,
            "types":[§_-x1k§]
         });
         this.§_-8T§ = new §_-H2O§();
         this.§_-8T§.x = 35;
         this.§_-8T§.y = 13;
         this.§_-56§.addChild(this.§_-8T§);
         this.§_-BX§.push({
            "object":this.§_-8T§,
            "types":[§_-x1k§]
         });
         var _loc2_:§_-K2G§ = new §_-K2G§(gls("Выход"));
         _loc2_.scaleX = _loc2_.scaleY = 0.65;
         _loc2_.x = 96;
         _loc2_.y = 15;
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-x2I§);
         this.§_-92T§.addChild(_loc2_);
         this.§_-BX§.push({
            "object":_loc2_,
            "types":[§_-x1k§]
         });
         _loc2_ = new §_-K2G§(gls("Выход"));
         _loc2_.scaleX = _loc2_.scaleY = 0.65;
         _loc2_.x = 96;
         _loc2_.y = 15;
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-H1Q§);
         this.§_-92T§.addChild(_loc2_);
         this.§_-BX§.push({
            "object":_loc2_,
            "types":[§_-V2B§]
         });
         _loc2_ = new §_-K2G§(gls("Выход"));
         _loc2_.scaleX = _loc2_.scaleY = 0.65;
         _loc2_.x = 96;
         _loc2_.y = 15;
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-C31§);
         this.§_-92T§.addChild(_loc2_);
         this.§_-BX§.push({
            "object":_loc2_,
            "types":[§_-7C§]
         });
         this.§_-S22§(§_-x1k§);
      }
      
      private function §_-31U§(param1:MouseEvent) : void
      {
         GameSounds.play("click",true);
      }
      
      private function §_-x2I§(param1:MouseEvent) : void
      {
         §_-u24§.§_-x2I§();
      }
      
      private function §_-H1Q§(param1:MouseEvent) : void
      {
         §_-t2c§.show("Location");
      }
      
      private function §_-C31§(param1:MouseEvent) : void
      {
         §_-t2c§.show(§_-t2c§.§_-di§);
      }
      
      private function §_-S22§(param1:int) : void
      {
         var _loc2_:* = undefined;
         for each(_loc2_ in this.§_-BX§)
         {
            _loc2_["object"].visible = _loc2_["types"].indexOf(param1) != -1;
         }
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         this.§_-8T§.onRemove(param1[0]);
      }
      
      private function §_-T14§(param1:ScreenEvent) : void
      {
         if(param1.screen is §_-u24§)
         {
            this.§_-S22§(§_-x1k§);
         }
         else if(param1.screen is §_-fx§)
         {
            this.§_-S22§(§_-V2B§);
         }
         else if(param1.screen is §_-S2E§)
         {
            this.§_-S22§(§_-7C§);
         }
         else
         {
            this.§_-S22§(§_-IO§);
         }
      }
   }
}

