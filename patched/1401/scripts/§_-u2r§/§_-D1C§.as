package §_-u2r§
{
   import §_-83V§.§_-12C§;
   import flash.events.Event;
   
   public class §_-D1C§ extends §_-12C§
   {
      
      public function §_-D1C§()
      {
         super(RapunzelPerkView,370,220);
      }
      
      override public function get stopInEnd() : Boolean
      {
         return true;
      }
      
      override protected function §_-r5§(param1:Event) : void
      {
         super.§_-r5§(param1);
         if(this.aging)
         {
            return;
         }
         this.aging = Boolean(this.view) && !view.isPlaying;
      }
   }
}

