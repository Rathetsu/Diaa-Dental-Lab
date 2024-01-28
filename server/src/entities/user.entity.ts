import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity('users')
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ length: 50, unique: true })
  username: string;

  @Column({ length: 100, unique: true })
  email: string;

  @Column({ length: 50 })
  first_name: string;

  @Column({ length: 50 })
  last_name: string;

  @Column({ length: 255 })
  avatar: string;

  @Column({ length: 255 })
  password: string;

  @Column({
    type: 'timestamp with time zone',
    default: () => 'CURRENT_TIMESTAMP',
  })
  created_at: Date;
}
