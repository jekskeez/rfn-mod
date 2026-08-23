package views
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class §_-O2q§ extends Sprite
   {
      
      private var target:DisplayObject;
      
      private var view:NotificationAnimationView;
      
      private var §_-8x§:Boolean = true;
      
      public function §_-O2q§(param1:DisplayObject, param2:Number = 0, param3:Number = 0)
      {
         super();
         this.view = new NotificationAnimationView();
         this.view.x = param1.x + param2;
         this.view.y = param1.y + param3;
         this.view.visible = true;
         this.view.gotoAndPlay(1);
         addChild(this.view);
         this.target = param1;
         if(this.target.parent)
         {
            this.target.parent.addChildAt(this,this.target.parent.numChildren);
         }
         else
         {
            this.target.addEventListener(Event.ADDED_TO_STAGE,this.§_-Ua§);
         }
      }
      
      public function get active() : Boolean
      {
         return this.§_-8x§;
      }
      
      public function set active(param1:Boolean) : void
      {
         if(this.§_-8x§ == param1)
         {
            return;
         }
         this.§_-8x§ = param1;
         this.view.visible = param1;
         if(param1)
         {
            this.view.gotoAndPlay(1);
         }
         else
         {
            this.view.stop();
         }
      }
      
      private function §_-Ua§(param1:Event) : void
      {
         this.target.removeEventListener(Event.ADDED_TO_STAGE,this.§_-Ua§);
         this.target.parent.addChildAt(this,this.target.parent.numChildren);
      }
   }
}

