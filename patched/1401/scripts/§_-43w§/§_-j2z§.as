package §_-43w§
{
   import Box2D.Dynamics.b2World;
   
   public class §_-j2z§ extends Hero
   {
      
      public function §_-j2z§(param1:int, param2:b2World, param3:int = 0, param4:int = 0)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function set shaman(param1:Boolean) : void
      {
         super.shaman = param1;
         this.team = param1 ? §_-O18§ : §_-JL§;
      }
   }
}

