package §_-42p§
{
   import Box2D.Common.Math.b2Vec2;
   
   public class §_-xG§
   {
      
      public var pos:b2Vec2 = new b2Vec2();
      
      public var vel:b2Vec2 = new b2Vec2();
      
      public var vel2:b2Vec2 = new b2Vec2();
      
      public var scale:Number = 10;
      
      public function §_-xG§()
      {
         super();
      }
      
      public function update(param1:Number = 0) : void
      {
         if(!param1)
         {
         }
         this.pos.Add(this.vel);
         this.pos.Add(this.vel2);
         this.vel2.x = Math.random() > 0.9 ? -this.vel2.x : Number(this.vel2.x);
      }
   }
}

