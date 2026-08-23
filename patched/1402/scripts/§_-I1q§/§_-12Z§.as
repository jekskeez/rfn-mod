package §_-I1q§
{
   import §_-8Q§.§_-p1u§;
   import flash.events.Event;
   
   public class §_-12Z§ extends §_-p1u§
   {
      
      public function §_-12Z§()
      {
         super(RapunzelPerkView,370,220);
      }
      
      override public function get stopInEnd() : Boolean
      {
         return true;
      }
      
      override protected function §_-52w§(param1:Event) : void
      {
         super.§_-52w§(param1);
         if(this.aging)
         {
            return;
         }
         this.aging = Boolean(this.view) && !view.isPlaying;
      }
   }
}

