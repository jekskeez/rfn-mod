package §_-z2V§
{
   import §_-X1k§.§_-L1o§;
   import §_-X1k§.§_-P2x§;
   import §_-a11§.§_-h2m§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.TextFormat;
   import tape.§_-2n§;
   import tape.§_-o2N§;
   
   public class WardrobeOutfitSkinsPanel extends Sprite
   {
      
      public static const SELECT_SKIN:String = "WardrobeOutfitSkinsPanel.SELECT_SKIN";
      
      private static const §_-92a§:int = 240;
      
      private static const §_-z2G§:int = 105;
      
      public var §_-ub§:int = -1;
      
      private var §_-eO§:§_-D2g§;
      
      public function WardrobeOutfitSkinsPanel()
      {
         super();
         graphics.beginFill(0,0.3);
         graphics.drawRoundRect(0,0,§_-92a§,§_-z2G§,25);
         var _loc1_:§_-i5§ = new §_-i5§(gls("Образы костюма"),0,-2,new TextFormat(§_-i5§.§_-p1s§,14,16777215));
         _loc1_.x = int((§_-92a§ - _loc1_.textWidth) * 0.5);
         addChild(_loc1_);
         this.§_-eO§ = new §_-D2g§(60,10,2);
         this.§_-eO§.x = 91;
         this.§_-eO§.y = 18;
         this.§_-eO§.addEventListener(§_-h2m§.SELECTED,this.§_-A15§);
         addChild(this.§_-eO§);
         this.visible = false;
      }
      
      public function §_-Pe§(param1:§_-2n§) : void
      {
         var data:§_-o2N§;
         var selected:§_-2n§ = param1;
         this.visible = selected != null && !§_-P2x§.§_-Q1Y§(selected.id);
         if(!this.visible)
         {
            return;
         }
         data = new §_-o2N§(§_-E1M§);
         data.setData(§_-P2x§.§_-y18§(selected.id).filter(function(param1:int, param2:int, param3:Array):Boolean
         {
            if(Boolean(param2) || Boolean(param3))
            {
            }
            return §_-P2x§.getPackageCoinsPrice(param1) != 0 || §_-L1o§.§_-J2p§(param1,§_-L1o§.§_-U1v§);
         }));
         this.§_-eO§.setData(data);
      }
      
      private function §_-A15§(param1:§_-h2m§) : void
      {
         if(param1.element == null)
         {
            return;
         }
         this.§_-ub§ = (param1.element as §_-2n§).id;
         dispatchEvent(new Event(SELECT_SKIN));
      }
   }
}

