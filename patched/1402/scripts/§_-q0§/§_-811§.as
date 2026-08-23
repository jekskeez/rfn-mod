package §_-q0§
{
   import Box2D.Common.Math.b2Vec2;
   
   public class §_-811§ extends §_-K1r§
   {
      
      public function §_-811§(param1:Hero)
      {
         super(param1);
         this.view = new ObjectNutView();
         this.view.x = -15;
         this.view.y = -20;
         addChild(this.view);
      }
      
      override public function update(param1:Number = 0) : void
      {
         super.update(param1);
         if(this.activated)
         {
            return;
         }
         var _loc2_:b2Vec2 = this.hero.position.Copy();
         _loc2_.Subtract(this.position);
         if(_loc2_.Length() >= 4)
         {
            return;
         }
         this.activated = true;
         removeChild(this.view);
         this.view = new ObjectNutActiveView();
         this.view.x = -15;
         this.view.y = -20;
         addChild(this.view);
      }
   }
}

