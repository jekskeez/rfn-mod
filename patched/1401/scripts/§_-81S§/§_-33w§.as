package §_-81S§
{
   import buttons.§_-91k§;
   import events.PostEvent;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   
   public class §_-33w§ extends Sprite
   {
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 13px;","color: #000000;","}","a {","color: #0063CE;","text-decoration: underline;","}","a:hover {","text-decoration: none;","color: #0063CE;","}",".greenMes {","font-size: 16px;","color: #26A30A;","text-align: center;","font-weight: bold;","}",".orange {","color: #C94900;","font-weight: bold;","}",".blackSmall {","color: #000000;","font-size: 11px;","line-height: 1;","}"].join("\n");
      
      protected static var style:StyleSheet = null;
      
      protected var §_-P1v§:§_-22V§ = null;
      
      protected var §_-O2e§:SimpleButton = null;
      
      public var eventId:int = -1;
      
      public var index:int = -1;
      
      public var time:uint = 0;
      
      public var type:int = -1;
      
      public function §_-33w§(param1:int, param2:int, param3:uint)
      {
         super();
         if(style == null)
         {
            style = new StyleSheet();
            style.parseCSS(§_-I2U§);
         }
         this.eventId = param1;
         this.time = param3;
         this.type = param2;
      }
      
      public function §_-027§() : void
      {
         if(this.§_-P1v§ != null)
         {
            return;
         }
         var _loc1_:PostElementBack = new PostElementBack();
         _loc1_.x = 80;
         _loc1_.y = 5;
         addChild(_loc1_);
         this.§_-P1v§ = new §_-22V§(this.timeString,630,10,new TextFormat(null,14,6504987,true));
         this.§_-P1v§.x = 660 - int(this.§_-P1v§.textWidth * 0.5);
         addChild(this.§_-P1v§);
         this.§_-O2e§ = new §_-91k§();
         this.§_-O2e§.x = 715;
         this.§_-O2e§.y = 7;
         this.§_-O2e§.addEventListener(MouseEvent.CLICK,this.onRemove);
         addChild(this.§_-O2e§);
      }
      
      protected function onRemove(param1:MouseEvent) : void
      {
         GameSounds.play(§_-43Z§.§_-o1e§);
         dispatchEvent(new PostEvent(this.eventId));
      }
      
      protected function get timeString() : String
      {
         var _loc1_:Date = new Date(this.time * 1000);
         var _loc2_:String = this.§_-p1x§(_loc1_.getDate());
         var _loc3_:String = this.§_-p1x§(_loc1_.getMonth() + 1);
         var _loc4_:String = this.§_-p1x§(_loc1_.getFullYear());
         return _loc2_ + "." + _loc3_ + "." + _loc4_;
      }
      
      protected function §_-p1x§(param1:int) : String
      {
         var _loc2_:String = String(param1);
         if(_loc2_.length < 2)
         {
            _loc2_ = "0" + _loc2_;
         }
         return _loc2_;
      }
   }
}

