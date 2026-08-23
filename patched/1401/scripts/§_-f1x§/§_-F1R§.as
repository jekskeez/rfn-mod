package §_-f1x§
{
   import §_-I10§.§_-k1C§;
   import §_-e1G§.§_-Hb§;
   import buttons.§_-j18§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import utils.§_-x1Z§;
   
   public class §_-F1R§ extends Sprite
   {
      
      private static const §_-p1u§:int = 0;
      
      private static const §_-s2j§:int = 1;
      
      private static const §_-pB§:int = 2;
      
      private var id:int;
      
      private var §_-y2x§:§_-j18§ = null;
      
      private var §_-71n§:int = -1;
      
      private var §_-D2V§:Boolean = false;
      
      private var §_-x1Q§:§_-Hb§ = null;
      
      private var §_-zt§:String;
      
      public function §_-F1R§(param1:int)
      {
         super();
         this.id = param1;
         this.init();
      }
      
      public function §_-bz§(param1:Boolean, param2:String = "") : void
      {
         this.§_-D2V§ = param1;
         if(param1)
         {
            this.§_-zt§ = param2;
            this.§_-x1Q§.setStatus(this.§_-zt§);
         }
         this.state = param1 ? §_-s2j§ : §_-p1u§;
      }
      
      public function set available(param1:Boolean) : void
      {
         this.state = param1 ? this.§_-71n§ : §_-pB§;
      }
      
      public function set §_-J11§(param1:Boolean) : void
      {
         this.mouseEnabled = !param1;
         this.mouseChildren = !param1;
      }
      
      private function init() : void
      {
         this.§_-y2x§ = new §_-j18§(gls("Собрать"));
         this.§_-y2x§.addEventListener(MouseEvent.CLICK,this.§_-11A§);
         addChild(this.§_-y2x§);
         this.§_-x1Q§ = new §_-Hb§(this,"",false,true);
      }
      
      private function set state(param1:int) : void
      {
         if(this.§_-71n§ == param1)
         {
            return;
         }
         if(this.§_-71n§ == §_-pB§)
         {
            return;
         }
         this.§_-71n§ = param1;
         if(param1 == §_-pB§)
         {
            this.visible = false;
            this.§_-x1Q§.remove();
            return;
         }
         this.§_-y2x§.filters = param1 == §_-s2j§ ? §_-x1Z§.§_-c2G§ : [];
         this.§_-y2x§.enabled = param1 != §_-s2j§;
         this.§_-x1Q§.alpha = param1 == §_-s2j§ ? 1 : 0;
      }
      
      private function §_-11A§(param1:MouseEvent) : void
      {
         §_-k1C§.§_-e1c§(this.id);
         this.§_-J11§ = true;
      }
   }
}

