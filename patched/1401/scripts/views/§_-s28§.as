package views
{
   import buttons.§_-wc§;
   import com.api.Player;
   import com.api.Services;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import flash.utils.setTimeout;
   import menu.§_-927§;
   import utils.§_-xb§;
   
   public class §_-s28§ extends Sprite
   {
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 14px;","color: #63421B;","}","a {","text-decoration: underline;","}","a:hover {","text-decoration: none;","}"].join("\n");
      
      private static var style:StyleSheet = null;
      
      private var photo:§_-s1A§ = null;
      
      private var caption:§_-22V§ = null;
      
      private var back:MovieClip = null;
      
      private var §_-b1g§:§_-wc§ = null;
      
      public var playerId:int = -1;
      
      public var state:Boolean = true;
      
      public var §_-42S§:Boolean = false;
      
      public function §_-s28§(param1:int)
      {
         super();
         if(style == null)
         {
            style = new StyleSheet();
            style.parseCSS(§_-I2U§);
         }
         this.playerId = param1;
         this.init();
      }
      
      public function §_-p2u§(param1:int) : void
      {
         setTimeout(Services.sendMessage,param1,Game.getPlayer(this.playerId).nid,gls("Держи подарок от меня, скорее открой его!"));
         (this.back as FriendGiftSendBack).imageRect.visible = false;
         this.§_-b1g§.visible = false;
         var _loc2_:Sprite = new Sprite();
         _loc2_.graphics.beginFill(16250092);
         _loc2_.graphics.lineStyle(2,16049098);
         _loc2_.graphics.drawRoundRect(0,0,120,23,5,5);
         var _loc3_:§_-22V§ = new §_-22V§(gls("Отправлено!"),0,2,new TextFormat(§_-22V§.§_-pJ§,14,16730637));
         _loc3_.x = 56 - int(_loc3_.textWidth * 0.5);
         _loc2_.addChild(_loc3_);
         _loc2_.x = 120;
         addChild(_loc2_);
         this.§_-42S§ = true;
      }
      
      private function init() : void
      {
         if(this.playerId == -1)
         {
            addChild(new FriendGiftSendEmpty());
            this.state = false;
            return;
         }
         this.photo = new §_-s1A§(66);
         addChild(this.photo);
         var _loc1_:RatingPlaceButton = new RatingPlaceButton();
         _loc1_.width = this.photo.width;
         _loc1_.height = this.photo.height;
         _loc1_.addEventListener(MouseEvent.MOUSE_UP,this.§_-i2I§);
         addChild(_loc1_);
         this.back = new FriendGiftSendBack();
         this.back.x = 68;
         this.back.y = 6;
         addChild(this.back);
         var _loc2_:SetDecorationButton = new SetDecorationButton();
         _loc2_.x = 12;
         _loc2_.y = -5;
         _loc2_.scaleX = _loc2_.scaleY = 2;
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-k2a§);
         var _loc3_:HideDecorationButton = new HideDecorationButton();
         _loc3_.x = 5;
         _loc3_.scaleX = _loc3_.scaleY = 2;
         _loc3_.addEventListener(MouseEvent.CLICK,this.§_-k2a§);
         this.§_-b1g§ = new §_-wc§(_loc2_,_loc3_,true);
         this.§_-b1g§.x = this.back.x + 230 - int(this.§_-b1g§.width * 0.5);
         this.§_-b1g§.y = this.back.y + 25 - int(this.§_-b1g§.height * 0.5);
         this.§_-b1g§.setState(true);
         addChild(this.§_-b1g§);
         this.caption = new §_-22V§("",75,0,style);
         this.caption.addEventListener(TextEvent.LINK,this.§_-o1P§);
         addChild(this.caption);
         var _loc4_:Player = Game.getPlayer(this.playerId);
         _loc4_.addEventListener(§_-hF§.§_-31X§ | §_-hF§.§_-31q§ | §_-hF§.§_-B3k§,this.§_-rF§);
         Game.request(this.playerId,§_-hF§.§_-31X§ | §_-hF§.§_-31q§ | §_-hF§.§_-B3k§);
      }
      
      private function §_-k2a§(param1:MouseEvent) : void
      {
         this.state = !this.state;
         this.§_-b1g§.setState(this.state);
      }
      
      private function §_-o1P§(param1:TextEvent) : void
      {
         §_-927§.§_-i2I§(this.playerId);
      }
      
      private function §_-i2I§(param1:MouseEvent) : void
      {
         §_-927§.§_-i2I§(this.playerId);
      }
      
      private function §_-rF§(param1:Player) : void
      {
         param1.removeEventListener(this.§_-rF§);
         this.photo.§_-031§(param1);
         this.caption.htmlText = "<body><b>" + §_-xb§.§_-e1r§(param1.name,"event:" + param1.id) + "</b></body>";
         this.caption.y = int((this.photo.height - this.caption.textHeight) * 0.5);
      }
   }
}

