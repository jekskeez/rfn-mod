package §_-I1q§
{
   import §_-8Q§.§_-p1u§;
   import §_-TK§.§_-f1u§;
   import flash.events.Event;
   import flash.utils.getDefinitionByName;
   
   public class §_-f2F§ extends §_-p1u§
   {
      
      public static var images:Array = null;
      
      public var type:int = 0;
      
      public function §_-f2F§()
      {
         if(!images)
         {
            images = [FarmerPerkView0,FarmerPerkView1,FarmerPerkView2];
         }
         this.type = int(Math.random() * images.length);
         super(null,0,0);
      }
      
      override public function §_-m1Y§() : *
      {
         var _loc1_:Array = super.§_-m1Y§();
         _loc1_.push([this.type]);
         return _loc1_;
      }
      
      override public function §_-o2I§(param1:*) : void
      {
         super.§_-o2I§(param1);
         this.type = param1[2][0];
         this.§_-91w§();
      }
      
      private function §_-91w§() : void
      {
         this.view = new §_-f1u§(new images[this.type]());
         this.view.play();
         this.view.x = 0;
         this.view.y = 10;
         §_-J2J§(this.view);
         if(this.stopInEnd)
         {
            this.view.addEventListener(Event.ENTER_FRAME,§_-52w§);
         }
      }
      
      override public function get stopInEnd() : Boolean
      {
         return true;
      }
   }
}

