package §_-u2r§
{
   import §_-83V§.§_-12C§;
   import §_-RI§.§_-d2d§;
   import flash.events.Event;
   import flash.utils.getDefinitionByName;
   
   public class §_-mv§ extends §_-12C§
   {
      
      public static var images:Array = null;
      
      public var type:int = 0;
      
      public function §_-mv§()
      {
         if(!images)
         {
            images = [FarmerPerkView0,FarmerPerkView1,FarmerPerkView2];
         }
         this.type = int(Math.random() * images.length);
         super(null,0,0);
      }
      
      override public function §_-A1X§() : *
      {
         var _loc1_:Array = super.§_-A1X§();
         _loc1_.push([this.type]);
         return _loc1_;
      }
      
      override public function §_-41M§(param1:*) : void
      {
         super.§_-41M§(param1);
         this.type = param1[2][0];
         this.§_-2i§();
      }
      
      private function §_-2i§() : void
      {
         this.view = new §_-d2d§(new images[this.type]());
         this.view.play();
         this.view.x = 0;
         this.view.y = 10;
         §_-83v§(this.view);
         if(this.stopInEnd)
         {
            this.view.addEventListener(Event.ENTER_FRAME,§_-r5§);
         }
      }
      
      override public function get stopInEnd() : Boolean
      {
         return true;
      }
   }
}

