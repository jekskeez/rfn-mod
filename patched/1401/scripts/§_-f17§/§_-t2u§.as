package §_-f17§
{
   import §_-RI§.§_-h2I§;
   import §_-ZS§.§_-93d§;
   import §_-ZS§.§_-f1G§;
   import §_-m1z§.§_-529§;
   import starling.core.Starling;
   
   public class §_-t2u§ extends §_-h2I§
   {
      
      private var §_-VO§:§_-f1G§ = null;
      
      private var view:§_-h2I§ = null;
      
      private var §_-E16§:Array = [];
      
      public function §_-t2u§()
      {
         super();
         this.view = new §_-h2I§(new VolcanoImage());
         §_-83v§(this.view);
      }
      
      public function deactivate() : void
      {
         this.§_-A38§ = §_-93d§.§_-h11§;
      }
      
      public function §_-21w§() : void
      {
         this.§_-A38§ = §_-93d§.§_-13Q§;
      }
      
      public function active() : void
      {
         this.§_-A38§ = §_-93d§.§_-y2a§;
      }
      
      private function set §_-A38§(param1:String) : void
      {
         var _loc2_:§_-529§ = null;
         if(this.§_-VO§)
         {
            this.§_-E16§.push(this.§_-VO§);
            this.§_-VO§.view.§_-Kn§ = 0;
            _loc2_ = new §_-529§(this.§_-VO§.view,1.5);
            _loc2_.§_-42i§("alpha",0);
            _loc2_.onComplete = this.§_-ms§;
            Starling.§_-A3B§.add(_loc2_);
         }
         this.§_-VO§ = §_-93d§.instance.§_-23j§(param1);
         this.§_-VO§.view.visible = true;
         this.§_-VO§.view.x = 50;
         this.§_-VO§.start();
         §_-d2R§(this.§_-VO§.view,0);
      }
      
      private function §_-ms§() : void
      {
         if(this.§_-E16§.length == 0)
         {
            return;
         }
         var _loc1_:§_-f1G§ = this.§_-E16§.shift();
         if(!_loc1_)
         {
            return;
         }
         _loc1_.stop();
         §_-93d§.instance.§_-ms§(_loc1_);
      }
   }
}

