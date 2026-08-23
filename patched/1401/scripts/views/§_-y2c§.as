package views
{
   import flash.display.DisplayObject;
   import utils.§_-w2v§;
   
   public class §_-y2c§ extends §_-w2v§
   {
      
      private var §_-F8§:DisplayObject = null;
      
      public function §_-y2c§(param1:Array, param2:int, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function §_-iD§(param1:DisplayObject) : void
      {
         if(this.§_-d2y§ == null)
         {
            return;
         }
         this.§_-F8§ = param1;
         this.§_-F8§.x = this.§_-d2y§.x;
         this.§_-F8§.y = this.§_-d2y§.y;
         this.§_-F8§.visible = false;
         addChildAt(this.§_-F8§,getChildIndex(this.§_-d2y§));
      }
      
      public function §_-w10§(param1:Boolean) : void
      {
         if(this.§_-F8§ == null)
         {
            return;
         }
         this.§_-F8§.visible = param1;
         this.§_-d2y§.visible = !param1;
      }
   }
}

