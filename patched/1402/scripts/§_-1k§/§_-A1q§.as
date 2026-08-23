package §_-1k§
{
   import §_-X1k§.§_-42H§;
   import com.api.Player;
   import flash.display.DisplayObject;
   import flash.events.TextEvent;
   import flash.text.TextFormat;
   import menu.§_-cD§;
   import protocol.§_-s2l§;
   import utils.§_-r1G§;
   
   public class §_-A1q§ extends §_-G2R§
   {
      
      private var caption:§_-i5§ = null;
      
      private var playerId:int = -1;
      
      private var §_-9p§:int = -1;
      
      private var §_-tS§:int = -1;
      
      public function §_-A1q§(param1:int, param2:int, param3:int, param4:int)
      {
         super(param1,§_-s2l§.§_-x1J§,param4);
         this.playerId = param2;
         this.§_-tS§ = param3 & 0xFF;
         this.§_-9p§ = param3 >> 8;
      }
      
      override public function §_-O1s§() : void
      {
         if(this.caption != null)
         {
            return;
         }
         super.§_-O1s§();
         var _loc1_:CollectionMailBackground = new CollectionMailBackground();
         _loc1_.mouseEnabled = false;
         _loc1_.mouseChildren = false;
         _loc1_.width = _loc1_.height = 80;
         addChild(_loc1_);
         var _loc2_:Class = §_-42H§.§_-D1U§(this.§_-9p§);
         var _loc3_:DisplayObject = new _loc2_();
         _loc3_.x = int((80 - _loc3_.width) * 0.5);
         _loc3_.y = int((80 - _loc3_.height) * 0.5);
         addChild(_loc3_);
         addChild(new §_-i5§("<body>" + gls("Игрок") + "</body>",85,10,style));
         this.caption = new §_-i5§("",125,10,style);
         this.caption.addEventListener(TextEvent.LINK,this.§_-QQ§);
         addChild(this.caption);
         addChild(new §_-i5§("<body>" + gls("обменялся с тобой!") + "<body>",85,25,style));
         var _loc4_:§_-i5§ = new §_-i5§(§_-42H§.§_-U13§[this.§_-tS§]["tittle"],85,40,new TextFormat(null,13,52275,true));
         addChild(_loc4_);
         var _loc5_:ExchangeArrowsView = new ExchangeArrowsView();
         _loc5_.scaleX = _loc5_.scaleY = 0.65;
         _loc5_.x = _loc4_.x + _loc4_.textWidth + 7;
         _loc5_.y = 42;
         addChild(_loc5_);
         addChild(new §_-i5§(§_-42H§.§_-U13§[this.§_-9p§]["tittle"],_loc5_.x + _loc5_.width,40,new TextFormat(null,13,39423,true)));
         var _loc6_:Player = Game.getPlayer(this.playerId);
         _loc6_.addEventListener(§_-Y2E§.§_-n2H§,this.§_-K16§);
         Game.request(this.playerId,§_-Y2E§.§_-n2H§);
      }
      
      private function §_-QQ§(param1:TextEvent) : void
      {
         §_-cD§.§_-e25§(this.playerId);
      }
      
      private function §_-K16§(param1:Player) : void
      {
         if(!type)
         {
         }
         param1.removeEventListener(this.§_-K16§);
         this.caption.htmlText = "<body><b>" + §_-r1G§.§_-fU§(param1.name,"event:" + param1.id) + "</b></body>";
      }
   }
}

