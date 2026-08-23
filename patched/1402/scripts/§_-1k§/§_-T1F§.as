package §_-1k§
{
   import buttons.§_-K2G§;
   import com.api.Player;
   import events.PostEvent;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.geom.Point;
   import flash.utils.getTimer;
   import menu.§_-cD§;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import protocol.§_-u1O§;
   import utils.§_-r1G§;
   import views.§_-O2E§;
   import views.§_-V2O§;
   
   public class §_-T1F§ extends §_-G2R§
   {
      
      private static const §_-k2y§:int = 86400;
      
      private var playerId:int = -1;
      
      private var §_-S21§:int = -1;
      
      private var caption:§_-i5§ = null;
      
      private var photo:§_-V2O§ = null;
      
      private var §_-T1L§:§_-K2G§ = null;
      
      private var movieGift:MovieClip = null;
      
      private var §_-D27§:Boolean = false;
      
      public function §_-T1F§(param1:int, param2:int, param3:int, param4:uint)
      {
         super(param1,param2,param4);
         this.playerId = param3;
      }
      
      override public function §_-O1s§() : void
      {
         if(this.caption != null)
         {
            return;
         }
         super.§_-O1s§();
         this.photo = new §_-V2O§(80);
         addChild(this.photo);
         var _loc1_:RatingPlaceButton = new RatingPlaceButton();
         _loc1_.width = this.photo.width;
         _loc1_.height = this.photo.height;
         _loc1_.addEventListener(MouseEvent.MOUSE_UP,this.§_-e25§);
         addChild(_loc1_);
         addChild(new §_-i5§("<body>" + gls("Твой друг") + "</body>",85,10,style));
         this.caption = new §_-i5§("",148,10,style);
         this.caption.addEventListener(TextEvent.LINK,this.§_-QQ§);
         addChild(this.caption);
         var _loc2_:§_-i5§ = new §_-i5§("<body>" + gls("подарил тебе подарок! Скорее узнай, что там внутри!") + "</body>",85,25,style);
         addChild(_loc2_);
         this.§_-T1L§ = new §_-K2G§(gls("Принять"));
         this.§_-T1L§.x = 660 - int(this.§_-T1L§.width * 0.5);
         this.§_-T1L§.y = 35;
         this.§_-T1L§.addEventListener(MouseEvent.CLICK,this.§_-12i§);
         addChild(this.§_-T1L§);
         this.movieGift = new PostGiftMovie();
         this.movieGift.x = 580;
         this.movieGift.y = 35;
         this.movieGift.gotoAndStop(0);
         addChild(this.movieGift);
         §_-p1V§.§_-63T§(this.§_-L23§);
         var _loc3_:Player = Game.getPlayer(this.playerId);
         _loc3_.addEventListener(§_-Y2E§.§_-s10§ | §_-Y2E§.§_-n2H§ | §_-Y2E§.§_-W1l§,this.§_-K16§);
         Game.request(this.playerId,§_-Y2E§.§_-s10§ | §_-Y2E§.§_-n2H§ | §_-Y2E§.§_-W1l§);
      }
      
      override protected function get timeString() : String
      {
         var _loc1_:int = this.time + §_-k2y§ - (Game.§_-i24§ + int(getTimer() / 1000));
         if(_loc1_ <= 0)
         {
            §_-p1V§.§_-B3x§(this.§_-L23§);
            dispatchEvent(new PostEvent(eventId));
            return "";
         }
         var _loc2_:String = (_loc1_ % 60).toString();
         _loc2_ = (_loc2_.length == 1 ? "0" : "") + _loc2_;
         _loc1_ /= 60;
         var _loc3_:String = (_loc1_ % 60).toString();
         _loc3_ = (_loc3_.length == 1 ? "0" : "") + _loc3_;
         _loc1_ /= 60;
         var _loc4_:String = (_loc1_ % 60).toString();
         _loc4_ = (_loc4_.length == 1 ? "0" : "") + _loc4_;
         return _loc4_ + ":" + _loc3_ + ":" + _loc2_;
      }
      
      override protected function onRemove(param1:MouseEvent) : void
      {
         if(this.§_-D27§)
         {
            return;
         }
         this.§_-D27§ = true;
         Connection.§_-e2T§(§_-u1O§.§_-GT§,1,this.eventId);
         super.onRemove(param1);
      }
      
      private function §_-12i§(param1:MouseEvent) : void
      {
         if(this.§_-D27§)
         {
            return;
         }
         this.§_-D27§ = true;
         this.§_-x2T§.visible = false;
         this.§_-T1L§.visible = false;
         this.§_-y2h§.visible = false;
         Connection.§_-e2T§(§_-u1O§.§_-GT§,0,this.eventId);
         Connection.listen(this.§_-x2f§,[§_-s2l§.§_-N8§]);
      }
      
      private function §_-x2f§(param1:§_-s2l§) : void
      {
         var packet:§_-s2l§ = param1;
         if(packet[1] != this.eventId)
         {
            return;
         }
         if(packet[2] != §_-O2E§.§_-x2G§)
         {
            this.§_-S21§ = packet[2];
            this.movieGift.play();
            this.movieGift.addFrameScript(17,function():void
            {
               showAward();
            });
            this.movieGift.addFrameScript(this.movieGift.totalFrames - 1,function():void
            {
               dispatchEvent(new PostEvent(eventId));
               movieGift.stop();
            });
         }
         else
         {
            dispatchEvent(new PostEvent(eventId));
         }
         Connection.forget(this.§_-x2f§,[§_-s2l§.§_-N8§]);
      }
      
      private function §_-L23§() : void
      {
         this.§_-y2h§.text = this.timeString;
         this.§_-y2h§.x = 657 - int(this.§_-y2h§.textWidth * 0.5);
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
         this.caption.htmlText = "<body><b>" + §_-r1G§.§_-fU§(param1.name,"event:" + param1.id) + "</b>,</body>";
      }
      
      private function showAward() : void
      {
         new §_-O2E§(this.§_-S21§,this.localToGlobal(new Point(this.movieGift.x,this.movieGift.y))).show();
      }
   }
}

