package §_-vK§
{
   import game.mainGame.Cast;
   import game.mainGame.entity.§_-63Q§;
   
   public class §_-O2o§ extends §_-21O§
   {
      
      protected var castObject:§_-63Q§ = null;
      
      protected var §_-13s§:int = 0;
      
      public function §_-O2o§(param1:Hero, param2:Array)
      {
         super(param1,param2);
      }
      
      override public function dispose() : void
      {
         if(Boolean(this.hero) && Boolean(this.hero.game) && Boolean(this.hero.game.cast))
         {
            this.hero.game.cast.forget(this.§_-J2R§);
         }
         this.castObject = null;
         super.dispose();
      }
      
      override public function get switchable() : Boolean
      {
         return false;
      }
      
      override public function §_-7J§() : void
      {
         this.§_-03R§ = false;
         if(this.castObject != null && this.hero.game.cast.castObject == this.castObject)
         {
            this.hero.game.cast.castObject = null;
            this.hero.game.cast.forget(this.§_-J2R§);
            this.castObject = null;
            return;
         }
         this.§_-I2a§();
         this.hero.game.cast.castObject = this.castObject;
         this.hero.game.cast.listen(this.§_-J2R§);
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
         this.hero.game.cast.forget(this.§_-J2R§);
         this.hero.game.cast.castObject = null;
         var _loc1_:Boolean = this.§_-13s§ < this.maxCastCount;
         if(_loc1_ && !this.§_-g1M§)
         {
            §_-Z1A§();
         }
         else
         {
            this.§_-13s§ = 0;
         }
      }
      
      override protected function onComplete() : void
      {
      }
      
      protected function §_-I2a§() : void
      {
      }
      
      protected function §_-J2R§(param1:String) : void
      {
         if(this.hero.game.cast.castObject != this.castObject)
         {
            return;
         }
         var _loc2_:Boolean = param1 == Cast.§_-q1W§;
         if(_loc2_)
         {
            ++this.§_-13s§;
         }
         this.active = _loc2_;
      }
      
      protected function get maxCastCount() : int
      {
         return 1;
      }
   }
}

