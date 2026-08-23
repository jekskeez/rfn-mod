package views
{
   import buttons.§_-613§;
   import com.api.Player;
   import com.api.Services;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import flash.utils.setTimeout;
   import menu.§_-cD§;
   import utils.§_-r1G§;
   
   public class §_-92F§ extends Sprite
   {
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 14px;","color: #63421B;","}","a {","text-decoration: underline;","}","a:hover {","text-decoration: none;","}"].join("\n");
      
      private static var style:StyleSheet = null;
      
      private var photo:§_-V2O§ = null;
      
      private var caption:§_-i5§ = null;
      
      private var back:MovieClip = null;
      
      private var §_-H2R§:§_-613§ = null;
      
      public var playerId:int = -1;
      
      public var state:Boolean = true;
      
      public var §_-D27§:Boolean = false;
      
      public function §_-92F§(param1:int)
      {
         super();
         if(style == null)
         {
            style = new StyleSheet();
            style.parseCSS(§_-aD§);
         }
         this.playerId = param1;
         this.init();
      }
      
      public function §_-03W§(param1:int) : void
      {
         setTimeout(Services.sendMessage,param1,Game.getPlayer(this.playerId).nid,gls("Держи подарок от меня, скорее открой его!"));
         (this.back as FriendGiftSendBack).imageRect.visible = false;
         this.§_-H2R§.visible = false;
         var _loc2_:Sprite = new Sprite();
         _loc2_.graphics.beginFill(16250092);
         _loc2_.graphics.lineStyle(2,16049098);
         _loc2_.graphics.drawRoundRect(0,0,120,23,5,5);
         var _loc3_:§_-i5§ = new §_-i5§(gls("Отправлено!"),0,2,new TextFormat(§_-i5§.§_-p1s§,14,16730637));
         _loc3_.x = 56 - int(_loc3_.textWidth * 0.5);
         _loc2_.addChild(_loc3_);
         _loc2_.x = 120;
         addChild(_loc2_);
         this.§_-D27§ = true;
      }
      
      private function init() : void
      {
         if(this.playerId == -1)
         {
            addChild(new FriendGiftSendEmpty());
            this.state = false;
            return;
         }
         this.photo = new §_-V2O§(66);
         addChild(this.photo);
         var _loc1_:RatingPlaceButton = new RatingPlaceButton();
         _loc1_.width = this.photo.width;
         _loc1_.height = this.photo.height;
         _loc1_.addEventListener(MouseEvent.MOUSE_UP,this.§_-e25§);
         addChild(_loc1_);
         this.back = new FriendGiftSendBack();
         this.back.x = 68;
         this.back.y = 6;
         addChild(this.back);
         var _loc2_:SetDecorationButton = new SetDecorationButton();
         _loc2_.x = 12;
         _loc2_.y = -5;
         _loc2_.scaleX = _loc2_.scaleY = 2;
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-ij§);
         var _loc3_:HideDecorationButton = new HideDecorationButton();
         _loc3_.x = 5;
         _loc3_.scaleX = _loc3_.scaleY = 2;
         _loc3_.addEventListener(MouseEvent.CLICK,this.§_-ij§);
         this.§_-H2R§ = new §_-613§(_loc2_,_loc3_,true);
         this.§_-H2R§.x = this.back.x + 230 - int(this.§_-H2R§.width * 0.5);
         this.§_-H2R§.y = this.back.y + 25 - int(this.§_-H2R§.height * 0.5);
         this.§_-H2R§.setState(true);
         addChild(this.§_-H2R§);
         this.caption = new §_-i5§("",75,0,style);
         this.caption.addEventListener(TextEvent.LINK,this.§_-QQ§);
         addChild(this.caption);
         var _loc4_:Player = Game.getPlayer(this.playerId);
         _loc4_.addEventListener(§_-Y2E§.§_-s10§ | §_-Y2E§.§_-n2H§ | §_-Y2E§.§_-W1l§,this.§_-K16§);
         Game.request(this.playerId,§_-Y2E§.§_-s10§ | §_-Y2E§.§_-n2H§ | §_-Y2E§.§_-W1l§);
      }
      
      private function §_-ij§(param1:MouseEvent) : void
      {
         this.state = !this.state;
         this.§_-H2R§.setState(this.state);
      }
      
      private function §_-QQ§(param1:TextEvent) : void
      {
         §_-cD§.§_-e25§(this.playerId);
      }
      
      private function §_-e25§(param1:MouseEvent) : void
      {
         §_-cD§.§_-e25§(this.playerId);
      }
      
      private function §_-K16§(param1:Player) : void
      {
         param1.removeEventListener(this.§_-K16§);
         this.photo.§_-yC§(param1);
         this.caption.htmlText = "<body><b>" + §_-r1G§.§_-fU§(param1.name,"event:" + param1.id) + "</b></body>";
         this.caption.y = int((this.photo.height - this.caption.textHeight) * 0.5);
      }
   }
}

