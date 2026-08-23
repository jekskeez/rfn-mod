package §_-o10§
{
   import game.mainGame.Cast;
   import game.mainGame.entity.§_-xn§;
   
   public class §_-Z23§ extends §_-S2w§
   {
      
      protected var castObject:§_-xn§ = null;
      
      protected var §_-q21§:int = 0;
      
      public function §_-Z23§(param1:Hero, param2:Array)
      {
         super(param1,param2);
      }
      
      override public function dispose() : void
      {
         if(Boolean(this.hero) && Boolean(this.hero.game) && Boolean(this.hero.game.cast))
         {
            this.hero.game.cast.forget(this.§_-98§);
         }
         this.castObject = null;
         super.dispose();
      }
      
      override public function get switchable() : Boolean
      {
         return false;
      }
      
      override public function §_-V1z§() : void
      {
         this.§_-B3M§ = false;
         if(this.castObject != null && this.hero.game.cast.castObject == this.castObject)
         {
            this.hero.game.cast.castObject = null;
            this.hero.game.cast.forget(this.§_-98§);
            this.castObject = null;
            return;
         }
         this.§_-02B§();
         this.hero.game.cast.castObject = this.castObject;
         this.hero.game.cast.listen(this.§_-98§);
      }
      
      override protected function deactivate() : void
      {
         super.deactivate();
         if(!this.isSelf)
         {
            return;
         }
         if(!this.hero.game || !this.hero.game.cast)
         {
            return;
         }
         if(!this.castObject || this.hero.game.cast.castObject != this.castObject)
         {
            return;
         }
         this.hero.game.cast.forget(this.§_-98§);
         this.hero.game.cast.castObject = null;
         var _loc1_:Boolean = this.§_-q21§ < this.maxCastCount;
         if(_loc1_ && !this.§_-x2b§)
         {
            §_-k1J§();
         }
         else
         {
            this.§_-q21§ = 0;
         }
      }
      
      override protected function onComplete() : void
      {
      }
      
      protected function §_-02B§() : void
      {
      }
      
      protected function §_-98§(param1:String) : void
      {
         if(this.hero.game.cast.castObject != this.castObject)
         {
            return;
         }
         var _loc2_:Boolean = param1 == Cast.§_-y2s§;
         if(_loc2_)
         {
            ++this.§_-q21§;
         }
         this.active = _loc2_;
      }
      
      protected function get maxCastCount() : int
      {
         return 1;
      }
   }
}

