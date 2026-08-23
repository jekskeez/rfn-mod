package §_-z2Z§
{
   import §_-I10§.§_-g2W§;
   import §_-I10§.§_-h1f§;
   import §_-r2Y§.§_-33e§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.TextFormat;
   import tape.§_-91w§;
   import tape.§_-A3s§;
   
   public class WardrobeOutfitSkinsPanel extends Sprite
   {
      
      public static const SELECT_SKIN:String = "WardrobeOutfitSkinsPanel.SELECT_SKIN";
      
      private static const §_-m29§:int = 240;
      
      private static const §_-He§:int = 105;
      
      public var §_-D27§:int = -1;
      
      private var §_-91d§:§_-ps§;
      
      public function WardrobeOutfitSkinsPanel()
      {
         super();
         graphics.beginFill(0,0.3);
         graphics.drawRoundRect(0,0,§_-m29§,§_-He§,25);
         var _loc1_:§_-22V§ = new §_-22V§(gls("Образы костюма"),0,-2,new TextFormat(§_-22V§.§_-pJ§,14,16777215));
         _loc1_.x = int((§_-m29§ - _loc1_.textWidth) * 0.5);
         addChild(_loc1_);
         this.§_-91d§ = new §_-ps§(60,10,2);
         this.§_-91d§.x = 91;
         this.§_-91d§.y = 18;
         this.§_-91d§.addEventListener(§_-33e§.SELECTED,this.§_-Y2a§);
         addChild(this.§_-91d§);
         this.visible = false;
      }
      
      public function §_-o1I§(param1:§_-A3s§) : void
      {
         var data:§_-91w§;
         var selected:§_-A3s§ = param1;
         this.visible = selected != null && !§_-g2W§.§_-Kg§(selected.id);
         if(!this.visible)
         {
            return;
         }
         data = new §_-91w§(§_-O1D§);
         data.setData(§_-g2W§.§_-W2m§(selected.id).filter(function(param1:int, param2:int, param3:Array):Boolean
         {
            if(Boolean(param2) || Boolean(param3))
            {
            }
            return §_-g2W§.getPackageCoinsPrice(param1) != 0 || §_-h1f§.§_-i21§(param1,§_-h1f§.§_-A3r§);
         }));
         this.§_-91d§.setData(data);
      }
      
      private function §_-Y2a§(param1:§_-33e§) : void
      {
         if(param1.element == null)
         {
            return;
         }
         this.§_-D27§ = (param1.element as §_-A3s§).id;
         dispatchEvent(new Event(SELECT_SKIN));
      }
   }
}

