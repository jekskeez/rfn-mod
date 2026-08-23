package §_-5T§
{
   import §_-S1n§.§_-kr§;
   import §_-X1k§.§_-WS§;
   import buttons.§_-K2G§;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import utils.§_-y1l§;
   
   public class §_-Wv§ extends Sprite
   {
      
      private static const §_-i2U§:int = 0;
      
      private static const §_-8S§:int = 1;
      
      private static const §_-s2V§:int = 2;
      
      private var id:int;
      
      private var §_-yx§:§_-K2G§ = null;
      
      private var §_-D2k§:int = -1;
      
      private var §_-ox§:Boolean = false;
      
      private var §_-5j§:§_-kr§ = null;
      
      private var §_-o2Y§:String;
      
      public function §_-Wv§(param1:int)
      {
         super();
         this.id = param1;
         this.init();
      }
      
      public function §_-vV§(param1:Boolean, param2:String = "") : void
      {
         this.§_-ox§ = param1;
         if(param1)
         {
            this.§_-o2Y§ = param2;
            this.§_-5j§.setStatus(this.§_-o2Y§);
         }
         this.state = param1 ? §_-8S§ : §_-i2U§;
      }
      
      public function set available(param1:Boolean) : void
      {
         this.state = param1 ? this.§_-D2k§ : §_-s2V§;
      }
      
      public function set §_-J29§(param1:Boolean) : void
      {
         this.mouseEnabled = !param1;
         this.mouseChildren = !param1;
      }
      
      private function init() : void
      {
         this.§_-yx§ = new §_-K2G§(gls("Собрать"));
         this.§_-yx§.addEventListener(MouseEvent.CLICK,this.§_-3T§);
         addChild(this.§_-yx§);
         this.§_-5j§ = new §_-kr§(this,"",false,true);
      }
      
      private function set state(param1:int) : void
      {
         if(this.§_-D2k§ == param1)
         {
            return;
         }
         if(this.§_-D2k§ == §_-s2V§)
         {
            return;
         }
         this.§_-D2k§ = param1;
         if(param1 == §_-s2V§)
         {
            this.visible = false;
            this.§_-5j§.remove();
            return;
         }
         this.§_-yx§.filters = param1 == §_-8S§ ? §_-y1l§.§_-Tk§ : [];
         this.§_-yx§.enabled = param1 != §_-8S§;
         this.§_-5j§.alpha = param1 == §_-8S§ ? 1 : 0;
      }
      
      private function §_-3T§(param1:MouseEvent) : void
      {
         §_-WS§.§_-o1s§(this.id);
         this.§_-J29§ = true;
      }
   }
}

