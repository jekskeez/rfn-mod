package §_-e2w§
{
   import §_-T2y§.§_-71o§;
   import §_-T2y§.§_-92z§;
   import §_-T2y§.§_-F29§;
   import §_-T2y§.§_-w17§;
   import buttons.§_-j18§;
   import events.ScreenEvent;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import sounds.GameSounds;
   import utils.§_-ex§;
   import views.§_-6x§;
   
   public class §_-52p§ extends Sprite
   {
      
      private static const §_-43s§:int = -1;
      
      private static const §_-cr§:int = 0;
      
      private static const §_-E2Q§:int = 1;
      
      private static const §_-u2L§:int = 2;
      
      private static var _instance:§_-52p§;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 14px;","color: #000000;","line-height: 1.5;","}",".count {","font-size: 13px;","color: #000000;","}","a {","text-decoration: underline;","}"].join("\n");
      
      private var §_-j2N§:§_-22V§;
      
      private var §_-R2J§:ImageClock;
      
      private var §_-Z14§:§_-6x§;
      
      private var §_-k2q§:Array = [];
      
      private var §_-J1p§:Sprite = null;
      
      private var §_-71r§:Sprite = null;
      
      public function §_-52p§()
      {
         _instance = this;
         super();
         this.visible = false;
         this.init();
         Connection.listen(this.§_-o2C§,[§_-S2I§.§_-R28§],1);
         §_-71o§.instance.addEventListener(ScreenEvent.SHOW,this.§_-W2P§);
      }
      
      public static function show() : void
      {
         §_-V1Q§();
         _instance.visible = true;
      }
      
      public static function hide() : void
      {
         _instance.visible = false;
      }
      
      public static function clear() : void
      {
         _instance.§_-j2N§.text = "";
         _instance.§_-R2J§.visible = false;
         _instance.§_-Z14§.hide();
      }
      
      public static function §_-O2r§(param1:int) : void
      {
         _instance.§_-j2N§.text = String(§_-ex§.§_-p1x§(param1));
         _instance.§_-j2N§.visible = true;
         _instance.§_-R2J§.visible = true;
      }
      
      public static function getTime() : String
      {
         return _instance.§_-j2N§.text;
      }
      
      public static function §_-OW§() : int
      {
         return int(_instance.§_-j2N§.text.split(":")[1]) + int(_instance.§_-j2N§.text.split(":")[0]) * 60;
      }
      
      public static function §_-62k§(param1:Array) : void
      {
         _instance.§_-Z14§.§_-62k§(param1.length);
      }
      
      public static function §_-u2t§(param1:Array, param2:Array) : void
      {
         _instance.§_-Z14§.§_-u2t§(param1,param2);
      }
      
      public static function §_-U2e§(param1:Array) : void
      {
         _instance.§_-Z14§.§_-66§.§_-I1K§(param1);
      }
      
      public static function §_-t9§(param1:int) : void
      {
         _instance.§_-Z14§.§_-66§.§_-t9§(param1);
      }
      
      public static function §_-g19§(param1:int) : void
      {
         _instance.§_-Z14§.show(param1 == §_-q1p§.§_-M1m§);
      }
      
      public static function §_-V1Q§() : void
      {
         if(!_instance)
         {
            return;
         }
         _instance.§_-J1p§.x = (Game.starling.stage.stageWidth - 110) * 0.5;
         _instance.§_-71r§.x = Game.starling.stage.stageWidth - _instance.§_-71r§.width;
      }
      
      public static function set §_-ot§(param1:Boolean) : void
      {
         var _loc2_:* = undefined;
         var _loc3_:§_-j18§ = null;
         for each(_loc2_ in _instance.§_-k2q§)
         {
            _loc3_ = _loc2_["object"] as §_-j18§;
            if(_loc3_)
            {
               _loc3_.enabled = param1;
            }
         }
      }
      
      public static function set §_-B1g§(param1:Boolean) : void
      {
         _instance.§_-J1p§.visible = param1;
      }
      
      private function init() : void
      {
         var _loc1_:StyleSheet = new StyleSheet();
         _loc1_.parseCSS(§_-I2U§);
         addChild(new HeaderGameLeft());
         this.§_-J1p§ = new Sprite();
         this.§_-J1p§.x = 395;
         this.§_-J1p§.addChild(new HeaderGameMiddle());
         addChild(this.§_-J1p§);
         this.§_-71r§ = new Sprite();
         this.§_-71r§.x = (Game.starling.stage.stageWidth - 157) * 0.5;
         this.§_-71r§.addChild(new HeaderGameRight());
         addChild(this.§_-71r§);
         this.§_-j2N§ = new §_-22V§("",25,13,new TextFormat(null,13,16777215,true));
         this.§_-J1p§.addChild(this.§_-j2N§);
         this.§_-k2q§.push({
            "object":this.§_-j2N§,
            "types":[§_-cr§]
         });
         this.§_-R2J§ = new ImageClock();
         this.§_-R2J§.x = 7;
         this.§_-R2J§.y = 13;
         this.§_-R2J§.cacheAsBitmap = true;
         this.§_-J1p§.addChild(this.§_-R2J§);
         this.§_-k2q§.push({
            "object":this.§_-R2J§,
            "types":[§_-cr§]
         });
         this.§_-Z14§ = new §_-6x§();
         this.§_-Z14§.x = 35;
         this.§_-Z14§.y = 13;
         this.§_-J1p§.addChild(this.§_-Z14§);
         this.§_-k2q§.push({
            "object":this.§_-Z14§,
            "types":[§_-cr§]
         });
         var _loc2_:§_-j18§ = new §_-j18§(gls("Выход"));
         _loc2_.scaleX = _loc2_.scaleY = 0.65;
         _loc2_.x = 96;
         _loc2_.y = 15;
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-j1q§);
         this.§_-71r§.addChild(_loc2_);
         this.§_-k2q§.push({
            "object":_loc2_,
            "types":[§_-cr§]
         });
         _loc2_ = new §_-j18§(gls("Выход"));
         _loc2_.scaleX = _loc2_.scaleY = 0.65;
         _loc2_.x = 96;
         _loc2_.y = 15;
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-O0§);
         this.§_-71r§.addChild(_loc2_);
         this.§_-k2q§.push({
            "object":_loc2_,
            "types":[§_-E2Q§]
         });
         _loc2_ = new §_-j18§(gls("Выход"));
         _loc2_.scaleX = _loc2_.scaleY = 0.65;
         _loc2_.x = 96;
         _loc2_.y = 15;
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-tH§);
         this.§_-71r§.addChild(_loc2_);
         this.§_-k2q§.push({
            "object":_loc2_,
            "types":[§_-u2L§]
         });
         this.§_-wd§(§_-cr§);
      }
      
      private function §_-23n§(param1:MouseEvent) : void
      {
         GameSounds.play("click",true);
      }
      
      private function §_-j1q§(param1:MouseEvent) : void
      {
         §_-92z§.§_-j1q§();
      }
      
      private function §_-O0§(param1:MouseEvent) : void
      {
         §_-71o§.show("Location");
      }
      
      private function §_-tH§(param1:MouseEvent) : void
      {
         §_-71o§.show(§_-71o§.§_-n2M§);
      }
      
      private function §_-wd§(param1:int) : void
      {
         var _loc2_:* = undefined;
         for each(_loc2_ in this.§_-k2q§)
         {
            _loc2_["object"].visible = _loc2_["types"].indexOf(param1) != -1;
         }
      }
      
      private function §_-o2C§(param1:§_-S2I§) : void
      {
         this.§_-Z14§.onRemove(param1[0]);
      }
      
      private function §_-W2P§(param1:ScreenEvent) : void
      {
         if(param1.screen is §_-92z§)
         {
            this.§_-wd§(§_-cr§);
         }
         else if(param1.screen is §_-w17§)
         {
            this.§_-wd§(§_-E2Q§);
         }
         else if(param1.screen is §_-F29§)
         {
            this.§_-wd§(§_-u2L§);
         }
         else
         {
            this.§_-wd§(§_-43s§);
         }
      }
   }
}

