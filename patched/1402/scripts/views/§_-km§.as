package views
{
   import flash.display.DisplayObject;
   import utils.§_-8p§;
   
   public class §_-km§ extends §_-8p§
   {
      
      private var §_-y1b§:DisplayObject = null;
      
      public function §_-km§(param1:Array, param2:int, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function §_-T1n§(param1:DisplayObject) : void
      {
         if(this.§_-33R§ == null)
         {
            return;
         }
         this.§_-y1b§ = param1;
         this.§_-y1b§.x = this.§_-33R§.x;
         this.§_-y1b§.y = this.§_-33R§.y;
         this.§_-y1b§.visible = false;
         addChildAt(this.§_-y1b§,getChildIndex(this.§_-33R§));
      }
      
      public function §_-n2d§(param1:Boolean) : void
      {
         if(this.§_-y1b§ == null)
         {
            return;
         }
         this.§_-y1b§.visible = param1;
         this.§_-33R§.visible = !param1;
      }
   }
}

