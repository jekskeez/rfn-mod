package §_-1k§
{
   import buttons.§_-917§;
   import events.PostEvent;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   
   public class §_-G2R§ extends Sprite
   {
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 13px;","color: #000000;","}","a {","color: #0063CE;","text-decoration: underline;","}","a:hover {","text-decoration: none;","color: #0063CE;","}",".greenMes {","font-size: 16px;","color: #26A30A;","text-align: center;","font-weight: bold;","}",".orange {","color: #C94900;","font-weight: bold;","}",".blackSmall {","color: #000000;","font-size: 11px;","line-height: 1;","}"].join("\n");
      
      protected static var style:StyleSheet = null;
      
      protected var §_-y2h§:§_-i5§ = null;
      
      protected var §_-x2T§:SimpleButton = null;
      
      public var eventId:int = -1;
      
      public var index:int = -1;
      
      public var time:uint = 0;
      
      public var type:int = -1;
      
      public function §_-G2R§(param1:int, param2:int, param3:uint)
      {
         super();
         if(style == null)
         {
            style = new StyleSheet();
            style.parseCSS(§_-aD§);
         }
         this.eventId = param1;
         this.time = param3;
         this.type = param2;
      }
      
      public function §_-O1s§() : void
      {
         if(this.§_-y2h§ != null)
         {
            return;
         }
         var _loc1_:PostElementBack = new PostElementBack();
         _loc1_.x = 80;
         _loc1_.y = 5;
         addChild(_loc1_);
         this.§_-y2h§ = new §_-i5§(this.timeString,630,10,new TextFormat(null,14,6504987,true));
         this.§_-y2h§.x = 660 - int(this.§_-y2h§.textWidth * 0.5);
         addChild(this.§_-y2h§);
         this.§_-x2T§ = new §_-917§();
         this.§_-x2T§.x = 715;
         this.§_-x2T§.y = 7;
         this.§_-x2T§.addEventListener(MouseEvent.CLICK,this.onRemove);
         addChild(this.§_-x2T§);
      }
      
      protected function onRemove(param1:MouseEvent) : void
      {
         GameSounds.play(§_-RH§.§_-K10§);
         dispatchEvent(new PostEvent(this.eventId));
      }
      
      protected function get timeString() : String
      {
         var _loc1_:Date = new Date(this.time * 1000);
         var _loc2_:String = this.§_-z2d§(_loc1_.getDate());
         var _loc3_:String = this.§_-z2d§(_loc1_.getMonth() + 1);
         var _loc4_:String = this.§_-z2d§(_loc1_.getFullYear());
         return _loc2_ + "." + _loc3_ + "." + _loc4_;
      }
      
      protected function §_-z2d§(param1:int) : String
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

