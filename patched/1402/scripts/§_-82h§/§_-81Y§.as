package §_-82h§
{
   import §_-81P§.§_-f1D§;
   import §_-A1G§.§_-11u§;
   import §_-A1G§.§_-w10§;
   import §_-TK§.§_-aS§;
   import starling.core.Starling;
   
   public class §_-81Y§ extends §_-aS§
   {
      
      private var §_-52C§:§_-11u§ = null;
      
      private var view:§_-aS§ = null;
      
      private var §_-x2D§:Array = [];
      
      public function §_-81Y§()
      {
         super();
         this.view = new §_-aS§(new VolcanoImage());
         §_-J2J§(this.view);
      }
      
      public function deactivate() : void
      {
         this.§_-W1u§ = §_-w10§.§_-j2R§;
      }
      
      public function §_-C1M§() : void
      {
         this.§_-W1u§ = §_-w10§.§_-62h§;
      }
      
      public function active() : void
      {
         this.§_-W1u§ = §_-w10§.§_-y2d§;
      }
      
      private function set §_-W1u§(param1:String) : void
      {
         var _loc2_:§_-f1D§ = null;
         if(this.§_-52C§)
         {
            this.§_-x2D§.push(this.§_-52C§);
            this.§_-52C§.view.§_-xZ§ = 0;
            _loc2_ = new §_-f1D§(this.§_-52C§.view,1.5);
            _loc2_.§_-02Q§("alpha",0);
            _loc2_.onComplete = this.§_-L1c§;
            Starling.§_-zb§.add(_loc2_);
         }
         this.§_-52C§ = §_-w10§.instance.§_-d1y§(param1);
         this.§_-52C§.view.visible = true;
         this.§_-52C§.view.x = 50;
         this.§_-52C§.start();
         §_-D2f§(this.§_-52C§.view,0);
      }
      
      private function §_-L1c§() : void
      {
         if(this.§_-x2D§.length == 0)
         {
            return;
         }
         var _loc1_:§_-11u§ = this.§_-x2D§.shift();
         if(!_loc1_)
         {
            return;
         }
         _loc1_.stop();
         §_-w10§.instance.§_-L1c§(_loc1_);
      }
   }
}

